#ifndef TRIANGLE_H
#define TRIANGLE_H

#include <GLFW/glfw3.h>
#include <stdlib.h>
#include <stdio.h>
#include <iostream>

namespace RMPH
{
    class TriangleSystem {
public:
    TriangleSystem() {
        if (glewInit() != GLEW_OK) exit(EXIT_FAILURE);
        std::cout << "GL_VERSION: " << glGetString(GL_VERSION) << std::endl;
        glfwSwapInterval(1);
    }

    ~TriangleSystem() {
    }
};

class Triangle {
public:

    float* vertex;
    unsigned int vao, vbo;
    float movement_force_x, movement_force_y;
    
    Triangle(float width, float height, float width_screen, float height_screen, TriangleSystem tt,float force_x,float force_y) {
        vertex = (float*)malloc(9 * sizeof(float));
        if (nullptr != vertex) {
            vertex[0] = -(width / width_screen) / 2;
            vertex[1] = -(height / height_screen) / 2;
            vertex[2] = 0;

            vertex[3] = (width / width_screen) / 2;
            vertex[4] = -(height / height_screen) / 2;
            vertex[5] = 0;

            vertex[6] = 0;
            vertex[7] = (height / height_screen) / 2;
            vertex[8] = 0;

            movement_force_x = force_x;
            movement_force_y = force_y;

            glGenBuffers(1, &vbo);
            glBindBuffer(GL_ARRAY_BUFFER, vbo);
            glBufferData(GL_ARRAY_BUFFER, 9 * sizeof(float), vertex, GL_STATIC_DRAW);

            glGenVertexArrays(1, &vao);
            glBindVertexArray(vao);
            glVertexAttribPointer(0, 3, GL_FLOAT, false, 0, (void*)0);
            glEnableVertexAttribArray(0);
        }
    }

    void SetUp() {
        glGenBuffers(1, &vbo);
        glBindBuffer(GL_ARRAY_BUFFER, vbo);
        glBufferData(GL_ARRAY_BUFFER, 9 * sizeof(float), vertex, GL_STATIC_DRAW);

        glGenVertexArrays(1, &vao);
        glBindVertexArray(vao);
        glVertexAttribPointer(0, 3, GL_FLOAT, false, 0, (void*)0);
        glEnableVertexAttribArray(0);
    }

    void MoveTriUp() {
        glDeleteBuffers(1, &vbo);
        glDeleteVertexArrays(1, &vao);
        vertex[1] += movement_force_y;
        vertex[4] += movement_force_y;
        vertex[7] += movement_force_y;
        SetUp();
    }

    void MoveTriDown() {
        glDeleteBuffers(1, &vbo);
        glDeleteVertexArrays(1, &vao);
        vertex[1] -= movement_force_y;
        vertex[4] -= movement_force_y;
        vertex[7] -= movement_force_y;
        SetUp();
    }

    void MoveTriLeft() {
        glDeleteBuffers(1, &vbo);
        glDeleteVertexArrays(1, &vao);
        vertex[0] -= movement_force_x;
        vertex[3] -= movement_force_x;
        vertex[6] -= movement_force_x;
        SetUp();
    }

    void MoveTriRight() {
        glDeleteBuffers(1, &vbo);
        glDeleteVertexArrays(1, &vao);
        vertex[0] += movement_force_x;
        vertex[3] += movement_force_x;
        vertex[6] += movement_force_x;
        SetUp();
    }

    void DrawTriangle() {
        glBindVertexArray(vao);
        glDrawArrays(GL_TRIANGLES, 0, 3);
    }

    ~Triangle() {
        free(vertex);
        glDeleteBuffers(1, &vbo);
        glDeleteVertexArrays(1, &vao);
    }
};

}

#endif