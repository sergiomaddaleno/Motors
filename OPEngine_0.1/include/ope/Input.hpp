#ifndef INPUT_HPP
#define INPUT_HPP

#include <GLFW/glfw3.h>
#include <map>
#include <vector>
#include <unordered_map>

class Input {
public:
    enum Keys {
        LEFT,
        RIGHT,
        UP,
        DOWN,
        W,
        A,
        S,
        D,
        SHIFT,
        CLICK,
        Keys_end
    };

    Input(GLFWwindow* window);
    ~Input();

    bool isKeyUp(int action);
    bool isKeyDown(int action);
    bool isKeyPressed(int action);
    bool isKeyReleased(int action);

    void assign(Keys t, int action);
    void updateKeyStates();

    std::map<int, Keys> keys;

    GLFWwindow* window_; // Puntero a la ventana de GLFW
private:

    void key_callback(int key, int scancode, int action, int mods);

    std::unordered_map<int, bool> keyStates;
    std::unordered_map<int, bool> previousKeyStates;
    //std::vector<int> keys;

    static inline std::unordered_map<GLFWwindow*, Input*> input_map;

    static void global_key_callback(GLFWwindow* window, int key, int scancode, int action, int mods);
};

#endif  

