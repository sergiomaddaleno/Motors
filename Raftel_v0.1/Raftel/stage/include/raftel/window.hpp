/**
 * @file window.hpp
 * @brief Provides the definition of window management and system setup for the Raftel engine.
 * @date 2025-03-10
 * @authors Carlos Mazcuñán Blanes, Marc Folgado Balbás
 *
 * @copyright All rights reserved.
 * This file includes classes and methods that handle window creation, context management, input handling,
 * and fullscreen toggling for the Raftel engine. The `WindowSystem` class is responsible for initializing
 * and managing the GLFW windowing system, while the `Window` class manages individual windows, allowing
 * for operations such as resizing, context switching, and buffer swapping.
 *
 * The file also includes essential OpenGL setup such as GLEW initialization and debug message callback
 * setup to facilitate debugging and error handling during OpenGL operations.
 */

#ifndef __WINDOW_H__
#define __WINDOW_H__ 1

#pragma once

#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <optional>

#include <memory>
#include <raftel/input.hpp>
#include <raftel/global_macros.hpp>
#include <glm/glm.hpp>

namespace Raftel {
    constexpr float SCREEN_WIDTH = 640.0f;  ///< Default width of the screen in pixels
    constexpr float SCREEN_HEIGHT = 480.0f; ///< Default height of the screen in pixels

    /**
     * @class WindowSystem
     * @brief Manages the initialization and termination of the GLFW window system.
     *
     * The `WindowSystem` class is responsible for setting up the GLFW library, and terminating it when no
     * longer needed. It ensures the proper management of the global windowing system.
     */
    class WindowSystem {
    public:
        /**
         * @brief Creates and initializes the WindowSystem.
         * @return A unique pointer to the created `WindowSystem` object, or `nullptr` if initialization fails.
         */
        static std::unique_ptr<WindowSystem> make();

        /**
         * @brief Destructor that terminates the GLFW library if necessary.
         */
        ~WindowSystem() noexcept;
        WindowSystem& operator=(WindowSystem&) {}        
        /**
         * @brief Move constructor for `WindowSystem`.
         *
         * This constructor transfers ownership of resources from another `WindowSystem` object.
         * @param other The object to move from.
         */
        WindowSystem(WindowSystem&& other) noexcept;

        /**
         * @brief Default constructor for `WindowSystem`.
         */
        WindowSystem();

    private:
        bool destroy_; ///< Flag indicating whether GLFW should be terminated when the object is destroyed.

        // Delete copy constructor and assignment operator to prevent copying
        WindowSystem(const WindowSystem&) = delete;
        WindowSystem& operator=(const WindowSystem&) = delete;
    };
    /**
    * @class Window
    * @brief Represents a single window in the system, supporting OpenGL context and input handling.
    *
    * The `Window` class manages an individual window's properties and provides methods to interact with
    * the OpenGL context. It supports features such as fullscreen toggling, resizing, and swapping buffers.
    * Input handling is also integrated within this class.
    */
    class Window
    {
     public:
         /**
         * @brief Creates a new window with the specified properties.
         * @param title The title of the window.
         * @param ws The window system to associate the window with.
         * @param width The width of the window (default 0 for fullscreen resolution).
         * @param height The height of the window (default 0 for fullscreen resolution).
         * @param fullscreen Whether the window should be fullscreen or not.
         * @return A unique pointer to the created `Window` object, or `nullptr` if creation fails.
         */
         static std::unique_ptr<Window> make(const char* title, WindowSystem& ws, int width = 0, int height = 0, bool fullscreen = false);
         /**
          * @brief Destructor that destroys the GLFW window and releases associated resources.
          */
         ~Window();                       
         NO_COPYABLE_OR_MOVABLE(Window)
         /**
         * @brief Makes the window context current for OpenGL operations.
         */
         void MakeContextCurrent();

         /**
          * @brief Checks if the window should close, optionally checking for the Escape key.
          * @param allowEscapeKey Whether the Escape key should be allowed to close the window.
          * @return `true` if the window should close, `false` otherwise.
          */
         bool ShouldClose(bool allowEscapeKey = true);

         /**
          * @brief Clears the window's buffer (color and depth).
          */
         void clear();

         /**
          * @brief Swaps the front and back buffers, displaying the rendered content.
          */
         void swapBuffers();

         /**
          * @brief Gets the current size of the window in screen coordinates.
          * @return A `glm::ivec2` representing the width and height of the window.
          */
         glm::ivec2 getScreenSize();
         /**
          * @brief Toggles between fullscreen and windowed modes.
          * @param window The GLFW window object to toggle.
          */
         void toggleFullscreen(GLFWwindow* window);
         /**
          * @brief Handles window resize events, adjusting the OpenGL viewport accordingly.
          * @param newWidth The new width of the window.
          * @param newHeight The new height of the window.
          */
         void onResize(int newWidth, int newHeight);

         std::unique_ptr<Input> input; ///< Input handler associated with the window.
         GLFWwindow* window_; ///< The GLFW window instance.

         /**
          * @brief Private constructor used by the `make` method to initialize the window.
          * @param w The GLFW window instance to associate with this `Window` object.
          */
         Window(GLFWwindow* w);

         bool isFullscreen = false; ///< Whether the window is in fullscreen mode.
    private:
        bool wasMaximized = false; ///< Whether the window was maximized before toggling fullscreen.
        int lastWidth, lastHeight; ///< Previous width and height of the window before switching fullscreen mode.
        int lastPosX, lastPosY; ///< Previous position of the window before switching fullscreen mode.

        int width, height; ///< Current width and height of the window.
        const char* name_; ///< Name of the window.
    };
} // namespace Raftel

#endif // !__WINDOW_HPP__