#ifndef WINDOW_H
#define WINDOW_H 1

#include <glad/glad.h>
#include <GLFW/glfw3.h>

#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include "tools.hpp"

namespace RMPH
{
    class WindowSystem {
    public:
        WindowSystem();
        ~WindowSystem();

        void SetErrorCallback(GLFWerrorfun err_callback);
        void PollEvent();

        // Eliminar copia
        WindowSystem(const WindowSystem&) = delete;
        WindowSystem& operator=(const WindowSystem&) = delete;
    };

    class Window {
    public:
        GLFWwindow* window_;

        Window(int x, int y, const char* name, WindowSystem* ws);
        ~Window();

        void SetKeyCallback(GLFWkeyfun callback);
        void SetMouseKeyInput(GLFWmousebuttonfun callback);
        void SetMouseCallBack(GLFWcursorposfun callback);
        void SetScrollCallBack(GLFWscrollfun callback);
        void SetFrameCallback(GLFWframebuffersizefun callback);

        bool IsOpen();
        void SwapBuffer();
        void GetFrameBufferSize(int& width, int& height);

        // Eliminar copia
        Window(const Window&) = delete;
        Window& operator=(const Window&) = delete;
    };
}

#endif
