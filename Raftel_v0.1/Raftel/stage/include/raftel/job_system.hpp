/**
 * @file job_system.hpp
 * @brief JobSystem class for managing multi-threaded task execution.
 * @date 2025-03-10
 * @author Carlos Mazcuñán Blanes
 * @author Marc Folgado Balbás
 *
 * @copyright All rights reserved.
 *
 * @details
 * The JobSystem class provides a simple way to manage multi-threaded jobs.
 * It creates a thread pool equal to the number of CPU cores available and
 * allows users to enqueue tasks that will be executed asynchronously by worker threads.
 *
 * ## Usage Example:
 *
 * @code
 * auto jobSystem = Raftel::JobSystem::make();
 *
 * // Submit a task and get a future result
 * auto futureResult = jobSystem->AddWork([](int a, int b) {
 *     return a + b;
 * }, 5, 3);
 *
 * // Wait for the result
 * int result = futureResult.get(); // result = 8
 * @endcode
 *
 */

#ifndef __JOB_SYSTEM_H__
#define __JOB_SYSTEM_H__ 1

#pragma once

#include <optional>
#include <vector>
#include <thread>
#include <mutex>
#include <functional>
#include <queue>
#include <future>
#include <memory>
#include <raftel/global_macros.hpp>

namespace Raftel {
	/**
    * @class JobSystem
    * @brief A multi-threaded job system for parallel task execution.
    */
    class JobSystem
    {
    public:
      /**
      * @brief Destructor that ensures proper thread cleanup.
      */
      ~JobSystem();
      
      /**
       * @brief Factory method to create a JobSystem instance.
       * @return A unique pointer to a new JobSystem instance.
       */
      static std::unique_ptr<JobSystem> make();
      
      /**
      * @brief Deleted copy and move constructors/operators to prevent copying or moving.
      *
      * This prevents accidental duplication or transfer of JobSystem instances,
      * ensuring that only one instance manages the worker threads.
      */

      NO_COPYABLE_OR_MOVABLE(JobSystem)
      
       /**
       * @brief Adds a job to the work queue.
       * @tparam MyJobFunction The type of the callable function.
       * @tparam Arguments Variadic template arguments for function parameters.
       * @param function The function to be executed by a worker thread.
       * @param params Parameters for the function.
       * @return A future object representing the result of the asynchronous job.
       */
      template<typename MyJobFunction, typename... Arguments>
      auto AddWork(MyJobFunction&& function, Arguments&&... params) -> std::future<decltype(function(params...))>;
      
      /**
      * @brief Constructor that initializes worker threads.
      */
      JobSystem();

    private:
      std::vector<std::thread> workers_;  ///< Worker threads pool.
      std::mutex queue_mutex_; ///< Worker threads pool.
      std::condition_variable warner_job_avaliable_;///< Condition variable for job availability.
      std::queue<std::function<void()>> work_queue_;///< Queue storing pending jobs.
      bool bStopThreads_; ///< Flag to indicate if threads should stop execution.
    };

    /**
    * @brief Adds a job to the work queue.
    * @tparam MyJobFunction The type of the callable function.
    * @tparam Arguments Variadic template arguments for function parameters.
    * @param function The function to be executed.
    * @param params Parameters for the function.
    * @return A future object representing the result of the asynchronous job.
    */
    template<typename MyJobFunction, typename ...Arguments>
    inline auto JobSystem::AddWork(MyJobFunction&& function, Arguments && ...params) -> std::future<decltype(function(params...))>
    {
        auto packet = [function = std::move(function), ...params = std::move(params)](){ return function(params...); };
        std::lock_guard lock{queue_mutex_};

        using work_type = decltype(function(params...));
        auto return_type = std::make_shared<std::packaged_task<work_type()>>(packet);

        std::future<work_type> f = return_type->get_future();
        work_queue_.push([return_type](){(*return_type)();});
        warner_job_avaliable_.notify_one();
        return f;
    }
} // namespace Raftel

#endif // __JOB_SYSTEM_H__