#ifndef ENGINESYSTEM_HPP
#define ENGINESYSTEM_HPP

#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <glm/glm.hpp>
#include <iostream>
#include <chrono>
#include <random>

class EngineSystem {
public:

    EngineSystem();
    void initialize(GLFWwindow* window);

    void enableVSync();
    void disableVSync();

    void getTime();
    float getDeltaTime();
    int getRandomNumber(int min, int max);
    glm::vec4 getRandomColorRGBA();

    double displayFPS();

    float lastFrameTime;
    int frameCount;
    float lastFPSUpdateTime;

    float fps;

    float time;
};

void GLAPIENTRY MessageCallback(GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, const GLchar* message, const void* userParam);

void setupOpenGLDebug();

#endif