#ifndef __LIGHT_COMPONENTS_HPP__
#define __LIGHT_COMPONENTS_HPP__ 1
#pragma once
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtx/quaternion.hpp>
#include <glm/gtc/matrix_access.hpp>
#include <raftel/mesh.hpp>
#include "raftel/shadow.hpp"
#include <lua.hpp> 


namespace Raftel {

    /**
     * @brief Basic component that provides a name attribute.
     */
    struct BasicComponent
    {
        /**
         * @brief Default constructor.
         */
        BasicComponent(): name(std::string(" ")) {}
        /**
         * @brief Sets the name of the component.
         * @param n_ The new name.
         */
        void SetName(std::string n_) { name = n_; }

        std::string name; /**< Name of the component. */
    };

    /**
     * @brief Represents the transformation component of an entity.
     */
    struct TransformComponent {
        glm::vec3 position; /**< Position of the entity. */
        glm::vec3 rotation; /**< Rotation of the entity. */
        glm::vec3 scale;    /**< Scale of the entity. */
        glm::mat4 transform; /**< Transformation matrix. */

        /**
         * @brief Gets the up vector of the transformation.
         * @return Normalized up vector.
         */
        glm::vec3 GetUpVector() const{
            return glm::normalize(glm::column(transform, 1));
        }
        /**
         * @brief Gets the right vector of the transformation.
         * @return Normalized right vector.
         */
        glm::vec3 GetRightVector() const
        {
            return glm::normalize(glm::column(transform, 0));
        }
        /**
         * @brief Gets the forward vector of the transformation.
         * @return Normalized forward vector.
         */
        glm::vec3 GetForwardVector() const
        {
            return glm::normalize(glm::column(transform, 2));
        }
        /**
         * @brief Default constructor initializing transformation parameters.
         */
        TransformComponent() : position(1.0f), rotation(1.0f), scale(1.0f), transform(1.0f) {}
        /**
        * @brief Constructor initializing with position, rotation, and scale.
        * @param pos Initial position.
        * @param rot Initial rotation.
        * @param sca Initial scale.
        */
        TransformComponent(const glm::vec3& pos, const glm::vec3& rot, const glm::vec3& sca)
            : position(pos), rotation(rot), scale(sca), transform(1.0f) {}
        /**
         * @brief Updates the transformation matrix.
         */
        void Update() {
            transform = glm::mat4(1.0f);
            glm::mat4 translationMatrix = glm::translate(transform, position);
            //solucion gymball lock
            auto quat = glm::quat(glm::radians(rotation));
            glm::mat4 rotationMatrix = glm::mat4_cast(quat);
            glm::mat4 scaleMatrix = glm::scale(transform, scale);
            transform = translationMatrix * rotationMatrix * scaleMatrix;
        }
    };

    /**
    * @brief Represents a mesh component.
    */
    struct MeshComponent {
        std::weak_ptr<Mesh> mesh; /**< Weak pointer to the mesh. */
    };

    /**
     * @brief Render component that determines visibility.
     */
    struct RenderComponent {
        bool visible;/**< Visibility flag. */
        /**
        * @brief Constructor for render component.
        * @param vis Initial visibility state.
        */
        RenderComponent(bool vis) : visible(vis) {}
    };

    /**
    * @brief Component that handles Lua scripting.
    */
    class ScriptComponent {
    public:
        /**
         * @brief Constructs a script component with the given script code.
         * @param script The Lua script code.
         */
        ScriptComponent(const std::string& script);
        /**
         * @brief Destructor that cleans up the Lua state.
         */
        ~ScriptComponent();
        MOVABLE_BUT_NOT_COPYABLE(ScriptComponent)

        /**
        * @brief Executes a Lua function within the script.
        * @param functionName The name of the function to execute.
        */
        void ExecuteFunction(const std::string& functionName);

        lua_State* luaState; /**< Lua state for script execution. */
        std::string scriptCode; /**< Script source code. */
        bool enabled = true; /**< Whether the script is enabled. */
        bool pause = true; /**< Whether the script execution is paused. */
    };

    /**
     * @brief Represents a light component with different light types.
     */
    struct LightComponent {
        /**
        * @brief Enumeration of light types.
        */
        enum class LightType {
            DIRECTIONAL, /**< Directional light (like sunlight). */
            POINT,       /**< Point light emitting in all directions. */
            SPOT,        /**< Spot light with an adjustable cone. */
            AMBIENT      /**< Ambient light affecting all objects equally. */
        } type; /**< Type of the light. */

        glm::vec3 color; /**< Color of the light. */
        float intensity; /**< Intensity of the light. */
        float range; /**< Range for point and spotlights. */
        float innerCone; /**< Inner cone angle for spotlights. */
        float outerCone; /**< Outer cone angle for spotlights. */
        float near; /**< Near plane distance for shadow mapping. */
        float far; /**< Far plane distance for shadow mapping. */
        std::unique_ptr<ShadowMap> shadowMap; /**< Shadow map associated with the light. */

        /**
         * @brief Calculates the shadow matrix for the light.
         * @param tr The transform component of the light.
         * @param cam The camera reference.
         */
        void CalculateShadowMatrix(const TransformComponent& tr, const class Camera& cam);

        /**
         * @brief Moves the attributes of another LightComponent instance.
         * @param other The LightComponent to move from.
         */
        void move(LightComponent& other);
        
        float fov; /**< Field of view for spotlights. */
        std::vector<glm::mat4> lightSpaceMatrix; /**< Shadow matrices. */

        /**
         * @brief Constructs a light component with given parameters.
         * @param lt Type of the light.
         * @param color_ Color of the light.
         * @param intensity_ Intensity of the light.
         * @param range_ Range of the light.
         * @param inner_ Inner cone angle (for spotlights).
         * @param outer_ Outer cone angle (for spotlights).
         * @param screenSize The screen size used for shadow mapping.
         */
        LightComponent(LightType lt, glm::vec3 color_, float intensity_, float range_, float inner_, float outer_, glm::ivec2 screenSize);
        MOVABLE_BUT_NOT_COPYABLE(LightComponent)

    };

}

#endif