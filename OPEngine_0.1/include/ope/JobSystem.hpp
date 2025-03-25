#ifndef JOBSYSTEM_HPP
#define JOBSYSTEM_HPP

#include <functional>
#include <queue>
#include <thread>
#include <mutex>
#include <vector>
#include <atomic>
#include <future>

class JobSystem {
public:
    JobSystem(); 
    ~JobSystem();

    JobSystem(JobSystem&&);
    JobSystem& operator=(JobSystem&&);
    
    template<typename F, typename... Args>
    auto add_task(F&& f, Args&&... args) -> std::future<std::invoke_result_t<F, Args...>> {
        using ResultType = std::invoke_result_t<F, Args...>;

        auto task = std::make_shared<std::packaged_task<ResultType()>>(
            std::bind(std::forward<F>(f), std::forward<Args>(args)...)
        );

        std::future<ResultType> result = task->get_future();
        {
            std::unique_lock<std::mutex> lock{ mutex_ };
            tasks_.emplace([task]() { (*task)(); });
        }
        worker_update_.notify_one();
        return result;
    }

    enum JobsystemActions {
        Next,
        Previous
    };

    void add_implementation(std::function<void()> f);
private:

    void run_tasks();
    
    std::mutex mutex_;
    std::queue<std::function<void()>> tasks_;
    std::condition_variable worker_update_;
    std::atomic<bool> quit_;
    std::vector<std::thread> workers_;
};

#endif  