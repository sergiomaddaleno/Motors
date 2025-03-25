#ifndef DRAW_HPP
#define DRAW_HPP

#include <GLFW/glfw3.h>
#include <iostream>

class GLManager {
public:
    GLManager();
    void defaultView();
    void drawTriangle(float centerX, float centerY, float size, float rotationAngle);
    ~GLManager();
};

#endif 
