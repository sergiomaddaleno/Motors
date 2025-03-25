#ifndef __MACROS_HPP__
#define __MACROS_HPP__ 1

#pragma once



namespace ConsoleColors {
    constexpr const char* RED = "\033[31m";
    constexpr const char* GREEN = "\033[32m";
    constexpr const char* YELLOW = "\033[33m";
    constexpr const char* BLUE = "\033[34m";
    constexpr const char* RESET = "\033[0m";
};




#define NO_COPYABLE_OR_MOVABLE(ClassName)               \
    ClassName(const ClassName&) = delete;               \
    ClassName& operator=(const ClassName&) = delete;    \
    ClassName(ClassName&&) = delete;                    \
    ClassName& operator=(ClassName&&) = delete;

#define COPYABLE_BUT_NOT_MOVABLE(ClassName)             \
    ClassName(const ClassName&) noexcept;               \
    ClassName& operator=(const ClassName&) noexcept;    \
    ClassName(ClassName&&) = delete;                    \
    ClassName& operator=(ClassName&&) = delete;

#define MOVABLE_BUT_NOT_COPYABLE(ClassName)             \
    ClassName(const ClassName&) = delete;               \
    ClassName& operator=(const ClassName&) = delete;    \
    ClassName(ClassName&&) noexcept;                    \
    ClassName& operator=(ClassName&&) noexcept;

#define COPYABLE_AND_MOVABLE(ClassName)                \
    ClassName(const ClassName&) noexcept;              \
    ClassName& operator=(const ClassName&) noexcept;   \
    ClassName(ClassName&&) noexcept;                   \
    ClassName& operator=(ClassName&&) noexcept;

#define TRUE 1
#define FALSE 0

#define LOG_ERROR(msg) \
    std::cerr << ConsoleColors::RED << "[ERROR] ("  << ConsoleColors::RESET << __FILE__ << ":" << __LINE__ << "): " << msg << std::endl;

#ifdef _DEBUG
    #define LOG_DEBUG(msg) std::cerr << ConsoleColors::YELLOW << "[DEBUG]: " << ConsoleColors::RESET << msg << std::endl;
#else
    #define LOG_DEBUG(msg)
#endif

#define SET_ERROR(msg) setError(msg, __FILE__, __LINE__)

#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))

#define PRINT_VAR(var) \
    std::cout << ConsoleColors::BLUE << #var << ConsoleColors::RESET <<" = " << (var) << std::endl;

#define TIMER_START() \
    auto start_time = std::chrono::high_resolution_clock::now();

#define TIMER_END() \
    { \
        auto end_time = std::chrono::high_resolution_clock::now(); \
        auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end_time - start_time); \
        std::cout << "Elapsed time: " << duration.count() << " ms" << std::endl; \
    }

#define CHECK_GL_ERROR() \
    { \
        GLenum err = glGetError(); \
        if (err != GL_NO_ERROR) { \
            LOG_ERROR("OpenGL error: " + std::to_string(err) + " at " + __FILE__ + ":" + std::to_string(__LINE__)); \
        } \
    }

#endif 