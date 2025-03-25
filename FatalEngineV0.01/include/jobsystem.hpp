#ifndef __JOB_SYSTEM_HPP__
#define __JOB_SYSTEM_HPP__ 1

#include <atomic>
#include <chrono>
#include <condition_variable>
#include <functional>
#include <future>
#include <iostream>
#include <memory>
#include <mutex>
#include <numeric>
#include <optional>
#include <queue>
#include <string>
#include <thread>
#include <tuple>
#include <utility>
#include <vector>

namespace RMPH {

    class JobSystem {
    public:
        JobSystem();
        ~JobSystem();

        JobSystem(JobSystem&&) noexcept;
        JobSystem& operator=(JobSystem&&) noexcept;

        // Método para añadir tareas al sistema
        template<typename T, typename... Args>
        std::future<std::invoke_result_t<T, Args&&...>>
            add(T&& f, Args&&... args);

    private:
        void worker();
        void add_implementation(std::move_only_function<void()> f);

        std::mutex mutex_;
        std::queue<std::move_only_function<void()>> tasks_;
        std::condition_variable worker_update_;
        std::atomic<bool> quit_;

        std::vector<std::thread> workers_;
    };

    // Definición del template (solo se puede quedar en el header)
    template<typename T, typename... Args>
    std::future<std::invoke_result_t<T, Args&&...>>
        JobSystem::add(T&& f, Args&&... args)
    {
        using packaged_t = std::packaged_task<std::invoke_result_t<T, Args&&...>(Args&&...)>;
        auto ptask = std::make_shared<packaged_t>(std::forward<T>(f), std::forward<Args>(args)...);
        auto future = ptask->get_future();
        auto curried = [ptask = std::move(ptask)]() mutable {
            (*ptask)();
            };
        add_implementation(std::move(curried));
        return future;
    }

} // namespace RMPH

#endif // __JOB_SYSTEM_HPP__
