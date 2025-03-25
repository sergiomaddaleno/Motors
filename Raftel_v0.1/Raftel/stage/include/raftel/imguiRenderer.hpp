#ifndef __IMGUIRENDERER_HPP__
#define __IMGUIRENDERER_HPP__ 1
#pragma once

#define IMGUI_IMPL_OPENGL_LOADER_CUSTOM

#include "imgui.h"
#include "../backends/imgui_impl_glfw.h"
#include "../backends/imgui_impl_opengl3.h"
#include <glm/vec3.hpp>


namespace Raftel {

    /**
     * @brief Stores the state of the entity window in the UI.
     */
    struct EntityWindowState {
        bool isOpen = true; /**< Indicates whether the entity window is open. */
        ImVec2 size = ImVec2(250, 500); /**< Size of the entity window. */
        glm::vec3 movementTarget = { 0.0f, 0.0f, 0.0f }; /**< Target position for entity movement. */
        bool isMoving = false; /**< Flag indicating whether the entity is moving. */
        float movementSpeed = 1.0f; /**< Speed at which the entity moves. */
        int current_entity = 0; /**< The ID of the currently selected entity. */
    };

    /**
     * @brief Handles rendering of the ImGui interface.
     */
    class imguiRenderer {
    public:
        /**
         * @brief Constructs an imguiRenderer and initializes ImGui for rendering.
         * @param window Pointer to the GLFW window.
         */
        imguiRenderer(GLFWwindow* window);

        /**
         * @brief Starts a new ImGui frame.
         */
        void newFrame();

        /**
         * @brief Ends the current ImGui frame and renders it.
         */
        void endFrame();

        /**
         * @brief Deleted copy constructor to prevent copying.
         */
        imguiRenderer(const imguiRenderer&) = delete;

        /**
         * @brief Deleted copy assignment operator to prevent copying.
         */
        imguiRenderer& operator=(const imguiRenderer&) = delete;

        /**
         * @brief Deleted move constructor to prevent moving.
         */
        imguiRenderer(imguiRenderer&&) = delete;

        /**
         * @brief Deleted move assignment operator to prevent moving.
         */
        imguiRenderer& operator=(imguiRenderer&&) = delete;
    };

} // namespace Raftel


#endif