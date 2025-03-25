#ifndef IMGUI_WINDOWS_HPP
#define IMGUI_WINDOWS_HPP

#include "raftel/ecs.hpp"
#include "raftel/camera.hpp"
#include "imgui.h"
#include <unordered_map>

namespace Raftel {

    /**
     * @brief Editor class that provides UI controls for managing entities and camera.
     */
    class Editor {
    public:
        /**
         * @brief Constructs an Editor object.
         */
        Editor();

        /**
         * @brief Destructor for the Editor.
         */
        ~Editor();

        /**
         * @brief Displays the main editor UI for managing entities and the camera.
         * @param cam Reference to the camera.
         * @param ecs Reference to the entity manager.
         */
        void Show(Raftel::Camera& cam, EntityManager& ecs);

        /**
         * @brief Displays shadow maps for entities with light components.
         * @param ecs Reference to the entity manager.
         */
        void ShowShadowMaps(EntityManager& ecs);

        int selectedEntityIndex; /**< Index of the currently selected entity in the editor. */

    private:
        bool useGizmo; /**< Flag indicating whether the gizmo tool is enabled. */

        /**
         * @brief Displays the camera control UI window.
         * @param cam Reference to the camera.
         */
        void ShowCameraControlWindow(Raftel::Camera& cam);

        /**
         * @brief Displays the UI window for creating new entities.
         * @param ecs Reference to the entity manager.
         */
        void ShowEntityCreatorWindow(EntityManager& ecs);

        /**
         * @brief Displays the properties window for modifying entity components.
         * @param ecs Reference to the entity manager.
         */
        void ShowEntityPropertiesWindow(EntityManager& ecs);

        /**
         * @brief Displays the gizmo control UI for manipulating entities.
         * @param ecs Reference to the entity manager.
         * @param cam Reference to the camera.
         */
        void ShowGizmoControls(EntityManager& ecs, Camera& cam);

        /**
         * @brief Displays the light component properties window.
         * @param l Optional reference to the light component.
         * @param t Optional reference to the transform component.
         */
        void LightComponent(std::optional<Raftel::LightComponent>& l, std::optional<Raftel::TransformComponent>& t);

        ImGuiStyle& style; /**< Reference to the ImGui style settings. */
        ImVec2 CameraComtrolSize; /**< Size of the camera control window. */
        ImVec2 EnityCreatorSize; /**< Size of the entity creator window. */
        Raftel::EntityWindowState entityWindow; /**< State of the entity window in the UI. */

        NO_COPYABLE_OR_MOVABLE(Editor) /**< Macro to prevent copying and moving of the Editor class. */
    };

}

#endif
