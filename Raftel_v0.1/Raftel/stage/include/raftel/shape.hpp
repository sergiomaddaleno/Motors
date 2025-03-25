/**
 * @file shape.hpp
 * @brief Defines the Shape class for 2D shapes in a graphical environment.
 * @date 2025-03-10
 * @authors Carlos Mazcuñán Blanes, Marc Folgado Balbás
 *
 * @copyright All rights reserved.
 *
 * This file contains the declaration of the Shape class, which is responsible
 * for creating and rendering a 2D shape using OpenGL. The Shape class uses
 * vertex data to define the shape and stores transformation data through
 * the Transform2D class. The class manages the OpenGL Vertex Array Object
 * (VAO) and Vertex Buffer Object (VBO) for rendering the shape.
 *
 * The shape can be transformed using the provided Transform2D object,
 * and it can be drawn using the draw() function.
 */

#ifndef __SHAPE_H__
#define __SHAPE_H__ 1

#pragma once

#include <vector>
#include "raftel\transform.hpp"

namespace Raftel {

    /**
     * @class Shape
     * @brief Represents a 2D shape made up of vertices that can be rendered to the screen.
     *
     * This class is responsible for handling the vertex data of the shape, setting up
     * the OpenGL buffers (VAO and VBO), and providing a function to render the shape to the screen.
     * It also includes a `Transform2D` member, which can be used to apply transformations (e.g.,
     * translation, scaling, and rotation) to the shape.
     */
    class Shape {
    public:

        /**
        * @brief Construct a new Shape object with the given vertices.
        *
        * Initializes the shape with the provided vertex data and sets up the
        * necessary OpenGL buffers (VAO, VBO) for rendering.
        *
        * @param vertices A vector of floats representing the vertex data of the shape.
        */
        Shape(const std::vector<float>& vertices);

        /**
        * @brief Renders the shape to the screen.
        *
        * This function binds the shape's VAO and draws the shape to the screen
        * using the stored vertex data. It also applies the transformation
        * before drawing and resets it afterward.
        */
        void draw();

        /**
         * @brief Destroy the Shape object and release OpenGL resources.
         *
         * Deletes the OpenGL Vertex Array Object (VAO) and Vertex Buffer Object (VBO)
         * associated with the shape to free resources when the object is destroyed.
         */
        ~Shape();

        Transform2D tr; ///< The 2D transformation applied to the shape.

    private:
        std::vector<float> vertices; ///< A vector storing the shape's vertex data.
        unsigned int VAO, VBO;  ///< OpenGL Vertex Array Object (VAO) and Vertex Buffer Object (VBO).

        /**
         * @brief Sets up the OpenGL buffers (VAO and VBO) for the shape.
         *
         * This function generates and configures the OpenGL buffers required to
         * render the shape. It stores the vertex data in the VBO and sets up
         * the attribute pointers for the VAO.
         */
        void setupShape();
    };
} // namespace

#endif // !__SHAPE_HPP__