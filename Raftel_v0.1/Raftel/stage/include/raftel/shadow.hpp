/**
 * @file shadow.hpp
 * @brief Header file for managing the shadow map in OpenGL.
 * @date 2025-03-10
 * @authors Carlos Mazcuñán Blanes, Marc Folgado Balbás
 *
 * @copyright All rights reserved.
 *
 * This file defines the ShadowMap class that is responsible for generating and managing
 * the shadow map used for shadow rendering. It includes methods to bind/unbind the
 * framebuffer, manage depth textures, and handle light space matrices for both
 * point and directional light sources.
 */


#ifndef __SHADOW_HPP__
#define __SHADOW_HPP__ 1

#include <GL/glew.h>
#include "glm/mat4x4.hpp"
#include "raftel/global_macros.hpp"
#include <vector>


#define SHADOW_WIDTH  1024 
#define SHADOW_HEIGHT 1024 

namespace Raftel {
    /**
     * @class ShadowMap
     * @brief Class responsible for managing the shadow map.
     *
     * The ShadowMap class handles the creation, binding, and management of a shadow map
     * in OpenGL. It supports both point light (using cube maps) and directional light
     * (using 2D textures). The shadow map stores depth information used for simulating
     * shadows in a 3D scene.
     */
    class ShadowMap {
    public:

        /**
         * @brief Constructor for the ShadowMap class.
         *
         * Initializes the shadow map based on the specified light type.
         * @param light_type The type of light (1 for point light, other for directional light).
         */
        ShadowMap(int light_type);

        /**
         * @brief Destructor for the ShadowMap class.
         *
         * Releases OpenGL resources associated with the shadow map.
         */
        ~ShadowMap();

        /**
         * @brief Macro to make the ShadowMap class movable but not copyable.
         *
         * This macro ensures that the ShadowMap class cannot be copied (i.e., it deletes
         * the copy constructor and copy assignment operator), but it can be moved (i.e.,
         * the move constructor and move assignment operator are provided).
         */
        COPYABLE_AND_MOVABLE(ShadowMap);

        /**
        * @brief Binds the framebuffer for rendering shadows.
        *
        * This function activates the framebuffer, allowing shadows to be rendered
        * into the shadow map texture.
        */
        void BindFramebuffer();

        /**
         * @brief Unbinds the framebuffer.
         *
         * This function deactivates the framebuffer, restoring the default framebuffer
         * for rendering.
         */
        void UnbindFramebuffer();

        /**
         * @brief Gets the depth map texture.
         *
         * @return The OpenGL ID of the depth map texture.
         */
        GLuint GetDepthMap() const { return depthMap; }

        /**
         * @brief Sets the light space transformation matrices.
         *
         * @param matrix A vector of light space transformation matrices.
         */
        void SetLightSpaceMatrix(const std::vector<glm::mat4>& matrix) { lightSpaceMatrix = matrix; }

        /**
         * @brief Gets the light space transformation matrices.
         *
         * @return A vector of light space transformation matrices.
         */
        std::vector<glm::mat4> GetLightSpaceMatrix() const { return lightSpaceMatrix; }

    private:
        GLuint depthMapFBO = 0; ///< The framebuffer object for the shadow map.
        GLuint depthMap = 0;      ///< The depth map texture (or CubeMap for point lights).
        std::vector<glm::mat4> lightSpaceMatrix;  ///< The light space transformation matrices.

        /**
         * @brief Initializes the shadow map resources.
         *
         * This function sets up the framebuffer and texture based on the light type.
         *
         * @param light_type The type of light (1 for point light, other for directional light).
         */
        void Initialize(int light_type);

        /**
         * @brief Releases OpenGL resources associated with the shadow map.
         */
        void ReleaseResources();
    };
} // namespace Raftel
#endif // !__SHADOW_HPP__
