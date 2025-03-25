#include <glad/glad.h>
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <iostream>

#include "Input.hpp" 
#include "window.hpp" 

int WinMain()
{
    float deltaTime = 0.0f;
    float lastFrame = 0.0f;

    const int kWidthWindow = 600;
    const int kHeightWindow = 600;

    RMPH::WindowSystem PD;
    RMPH::Window screen{ kWidthWindow,kHeightWindow,"MainScene",&PD };

    RMPH::Input inputManager{ &screen,&PD };

    while (screen.IsOpen() && !inputManager.IsKeyPressed(RMPH::Input::keys::ESC))
    {

        float currentFrame = static_cast<float>(glfwGetTime());
        deltaTime = currentFrame - lastFrame;
        lastFrame = currentFrame;

        screen.SwapBuffer();
        glfwPollEvents();
    }

    screen.~Window();
    PD.~WindowSystem();

    return 0;
}