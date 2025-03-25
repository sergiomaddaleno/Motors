#ifndef WINDOW_HPP
#define WINDOW_HPP

#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <iostream>
#include <optional>
#include <map>
#include <vector>
#include <unordered_map>

class EngineSystem;

class Window {
public:
    static std::optional<Window> make(int width, int height, const std::string& name, EngineSystem system);

    Window(GLFWwindow* glfwWindow);
    void makeContext(EngineSystem system);
    bool isOpen();
    void clear(float r, float g, float b, float a);
    void swapBuffers();
    void pollEvents();

    GLFWwindow* getWindow() const;

    // Constructor de movimiento
    Window(Window&& other) noexcept {
        window = other.window;
        other.window = nullptr;
    }

    // Operador de asignaci�n por movimiento
    Window& operator=(Window&& other) noexcept {
        if (this != &other) {
            if (window != nullptr) {
                glfwDestroyWindow(window);
            }
            window = other.window;
            other.window = nullptr;
        }
        return *this;
    }

    ~Window();

private:
    //Puntero a la ventana GLFW
    GLFWwindow* window;                 

    // Deshabilitar la copia
    Window(const Window&);
    Window& operator=(const Window&);
};



#endif  



