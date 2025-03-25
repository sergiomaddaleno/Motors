#ifndef INPUT_H
#define INPUT_H 1

#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <unordered_map>
#include <vector>
#include "window.hpp"

namespace RMPH
{
    class Input {
    public:
        // Enumeradores para teclas, mouse y estado de teclas
        enum keys {
            ESC, UP, DOWN, RIGHT, LEFT, W, A, S, D, Q, E,
            MOUSE_RIGHT, MOUSE_LEFT, MOUSE_CENTER
        };

        enum mouse { Y, X, SCROLL };
        enum state_key { PRESSED, RELEASED, REPEAT };

        // Constructor y Destructor
        Input(Window* win, WindowSystem* wt);
        ~Input();

        // Métodos públicos
        bool IsKeyPressed(keys k);
        bool IsKeyReleased(keys k);
        bool IsKeyRepeat(keys k);
        float MouseX();
        float MouseY();
        float Scroll();

        // Eliminar copia
        Input(const Input&) = delete;
        Input& operator=(const Input&) = delete;

    private:
        // Estado de teclas y mouse
        std::vector<state_key> Keys;
        std::vector<float> Mouse;
        Window* win_;

        // Métodos privados de callbacks
        void InputScrollCallBack(double xoffset, double yoffset);
        void InputMouseCallBack(double xposIn, double yposIn);
        void InputMouseKey(int button, int action, int mods);
        void InputKeyCallBack(int key, int scancode, int action, int mods);

        // Mapa estático para asociar ventanas a inputs
        static std::unordered_map<GLFWwindow*, Input*> input_map;

        // Métodos estáticos de callback global
        static void global_key_callback(GLFWwindow* window, int key, int scancode, int action, int mods);
        static void global_mouse_callback(GLFWwindow* window, double xposIn, double yposIn);
        static void global_scroll_callback(GLFWwindow* window, double xoffset, double yoffset);
        static void global_mouse_key_callback(GLFWwindow* window, int button, int action, int mods);
    };
}

#endif
