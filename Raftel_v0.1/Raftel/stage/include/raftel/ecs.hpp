#ifndef __ECS_H__
#define __ECS_H__ 1

#pragma once

#include <cstddef>
#include <vector>
#include <optional>
#include <memory>
#include <string>
#include "raftel/imguiRenderer.hpp"
#include <raftel/global_macros.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtx/quaternion.hpp>
#include <raftel/components.hpp>

namespace Raftel {
    class Camera;
    class Mesh;
    class ShaderProgram;
    class EntityManager; 

    constexpr size_t MAX_ENTITIES = 200;

    /**
     * @brief Represents an entity in the ECS (Entity Component System).
     */
    class Entity {
    public:
        size_t ID; /**< Unique identifier for the entity. */

        /**
         * @brief Adds a TransformComponent to the entity.
         * @param trans The transform component to add.
         */
        void addTransformComp(TransformComponent&& trans); 

        /**
         * @brief Retrieves the TransformComponent of the entity.
         * @return The TransformComponent if available.
         */
        std::optional<TransformComponent>& getTransformComp();

        /**
     * @brief Retrieves the TransformComponent of the entity (const version).
     * @return The TransformComponent if available.
     */
        const std::optional<TransformComponent>& getTransformComp() const;

        /**
     * @brief Adds a ScriptComponent to the entity.
     * @param script The script component to add.
     */
        void addScriptComp(ScriptComponent&& script);

        /**
    * @brief Retrieves the ScriptComponent of the entity.
    * @return The ScriptComponent if available.
    */
        std::optional<ScriptComponent>& getScriptComp();

        /**
     * @brief Adds a RenderComponent to the entity.
     * @param rend The render component to add.
     */
        void addRenderComp(RenderComponent&& rend);

        /**
     * @brief Adds a MeshComponent to the entity.
     * @param mesh Shared pointer to the mesh.
     */
        void addMeshComp(const std::shared_ptr<Mesh>& mesh);
        /**
     * @brief Checks if the entity has a mesh component.
     * @return True if the entity has a mesh component, false otherwise.
     */
        bool hasMeshComp() const;
        /**
     * @brief Checks if the entity has a transform component.
     * @return True if the entity has a transform component, false otherwise.
     */
        bool hasTransformComp() const;
        /**
    * @brief Checks if the entity has a render component.
    * @return True if the entity has a render component, false otherwise.
    */
        bool hasRenderComp() const;
        /**
     * @brief Checks if the entity has a light component.
     * @return True if the entity has a light component, false otherwise.
     */
        bool hasLightComp() const;
        /**
    * @brief Checks if the entity has a script component.
    * @return True if the entity has a script component, false otherwise.
    */
        bool hasScriptComp() const;

        /**
     * @brief Removes the mesh component from the entity.
     */
        void removeMeshComp();

        /**
     * @brief Adds a LightComponent to the entity.
     * @param light The light component to add.
     */
        void addLightComp(LightComponent&& light);
        /**
     * @brief Retrieves the LightComponent of the entity.
     * @return The LightComponent if available.
     */
        std::optional<LightComponent>& getLightComp();
        /**
     * @brief Retrieves the LightComponent of the entity (const version).
     * @return The LightComponent if available.
     */
        const std::optional<LightComponent>& getLightComp() const;

        /**
     * @brief Retrieves the MeshComponent of the entity.
     * @return The MeshComponent if available.
     */
        std::optional<MeshComponent> getMeshComp() const;

        /**
    * @brief Default copy constructor.
    * @param other The entity to copy.
    */
        Entity(const Entity& other) = default;

        /**
     * @brief Default move constructor.
     * @param other The entity to move.
     */
        Entity(Entity&& other) noexcept = default;

        /**
     * @brief Default copy assignment operator.
     * @param other The entity to copy.
     * @return Reference to this entity.
     */
        Entity& operator=(const Entity& other) = default;

        /**
    * @brief Default move assignment operator.
    * @param other The entity to move.
    * @return Reference to this entity.
    */
        Entity& operator=(Entity&& other) noexcept = default;

        //COPYABLE_AND_MOVABLE(Entity)
    private:
        friend class EntityManager;
        EntityManager* em; /**< Pointer to the entity manager. */

        /**
         * @brief Private constructor for creating an entity.
         * @param ID Unique identifier of the entity.
         * @param em Pointer to the entity manager.
         */
        Entity(size_t ID, EntityManager* em);

        /**
     * @brief Sets the position of the entity.
     * @param pos New position.
     */
        void setPosition(const glm::vec3& pos);

        /**
         * @brief Retrieves the position of the entity.
         * @return The current position of the entity.
         */
        glm::vec3 getPosition() const;

        /**
         * @brief Sets the rotation of the entity.
         * @param rot New rotation.
         */
        void setRotation(const glm::vec3& rot);

        /**
         * @brief Retrieves the rotation of the entity.
         * @return The current rotation of the entity.
         */
        glm::vec3 getRotation() const;

        /**
         * @brief Sets the scale of the entity.
         * @param scale New scale.
         */
        void setScale(const glm::vec3& scale);

        /**
         * @brief Retrieves the scale of the entity.
         * @return The current scale of the entity.
         */
        glm::vec3 getScale() const;

        /**
         * @brief Sets the mesh of the entity.
         * @param mesh Shared pointer to the mesh.
         */
        void setMesh(const std::shared_ptr<Mesh>& mesh);

        /**
         * @brief Retrieves the mesh of the entity.
         * @return The MeshComponent if available.
         */
        std::optional<MeshComponent> getMesh() const;

        /**
         * @brief Moves the entity towards a target position at a given speed.
         * @param target Target position.
         * @param speed Movement speed.
         */
        void moveTo(const glm::vec3& target, float speed);
    };

    /**
 * @brief Manages entities in the ECS (Entity Component System).
 */
    class EntityManager {
    public:
        /**
    * @brief Constructs an EntityManager.
    */
        EntityManager();

        /**
         * @brief Creates a new entity and returns it.
         * @return The created entity.
         */
        Entity CreateEntity();

        /**
         * @brief Retrieves a constant reference to the list of active entities.
         * @return A vector containing the active entities.
         */
        const std::vector<Entity>& getActiveEntities() const;
        /**
     * @brief Retrieves a mutable reference to the list of active entities.
     * @return A vector containing the active entities.
     */
        std::vector<Entity>& getActiveEntities();

        /**
         * @brief Updates the entity manager, processing entity behavior.
         * @param deltaTime Time elapsed since the last update.
         */
        void Update(float deltaTime);

        /**
         * @brief Sets the position of an entity.
         * @param ID The entity ID.
         * @param pos The new position.
         */
        void setPosition(size_t ID, const glm::vec3& pos);

        /**
         * @brief Gets the position of an entity.
         * @param ID The entity ID.
         * @return The position of the entity.
         */
        glm::vec3 getPosition(size_t ID) const;

        /**
         * @brief Sets the rotation of an entity.
         * @param ID The entity ID.
         * @param rot The new rotation.
         */
        void setRotation(size_t ID, const glm::vec3& rot);

        /**
         * @brief Gets the rotation of an entity.
         * @param ID The entity ID.
         * @return The rotation of the entity.
         */
        glm::vec3 getRotation(size_t ID) const;

        /**
         * @brief Sets the scale of an entity.
         * @param ID The entity ID.
         * @param scale The new scale.
         */
        void setScale(size_t ID, const glm::vec3& scale);

        /**
         * @brief Gets the scale of an entity.
         * @param ID The entity ID.
         * @return The scale of the entity.
         */
        glm::vec3 getScale(size_t ID) const;

        /**
         * @brief Assigns a mesh to an entity.
         * @param ID The entity ID.
         * @param mesh Shared pointer to the mesh.
         */
        void setMesh(size_t ID, const std::shared_ptr<Mesh>& mesh);

        /**
         * @brief Retrieves the mesh component of an entity.
         * @param ID The entity ID.
         * @return The mesh component if available.
         */
        std::optional<MeshComponent> getMesh(size_t ID) const;

        /**
         * @brief Moves an entity to a target position at a given speed.
         * @param ID The entity ID.
         * @param target The target position.
         * @param speed The movement speed.
         */
        void moveTo(size_t ID, const glm::vec3& target, float speed);

        /**
         * @brief Moves an entity in a straight direction continuously.
         * @param ID The entity ID.
         * @param speed The movement speed.
         * @param isHorizontal True for horizontal movement, false for vertical.
         */
        void constantStraightMovement(size_t ID, float speed, bool isHorizontal);

        /**
         * @brief Adds a mesh component to an entity.
         * @param ID The entity ID.
         * @param mesh Shared pointer to the mesh.
         */
        void addMeshComp(size_t ID, const std::shared_ptr<Mesh>& mesh);

        /**
         * @brief Retrieves the mesh component of an entity.
         * @param ID The entity ID.
         * @return The mesh component if available.
         */
        std::optional<MeshComponent> getMeshComponent(size_t ID);

        /**
         * @brief Checks if an entity has a mesh component.
         * @param ID The entity ID.
         * @return True if the entity has a mesh component, false otherwise.
         */
        bool hasMeshComponent(size_t ID) const;

        /**
         * @brief Removes the mesh component from an entity.
         * @param ID The entity ID.
         */
        void removeMeshComponent(size_t ID);

        /**
         * @brief Adds a transform component to an entity.
         * @param ID The entity ID.
         * @param trans The transform component to add.
         */
        void addTransformComp(size_t ID, TransformComponent&& trans);

        /**
         * @brief Adds a render component to an entity.
         * @param ID The entity ID.
         * @param rend The render component to add.
         */
        void addRenderComp(size_t ID, RenderComponent&& rend);

        /**
         * @brief Adds a script component to an entity.
         * @param ID The entity ID.
         * @param script The script component to add.
         */
        void addScriptComp(size_t ID, ScriptComponent&& script);

        /**
         * @brief Adds a light component to an entity.
         * @param ID The entity ID.
         * @param light The light component to add.
         */
        void addLightComp(size_t ID, LightComponent&& light);

        /**
         * @brief Retrieves the light component of an entity.
         * @param ID The entity ID.
         * @return The light component if available.
         */
        std::optional<Raftel::LightComponent>& getLightComponent(size_t ID);

        /**
         * @brief Removes an entity from the system.
         * @param ID The entity ID.
         */
        void removeEntity(size_t id);
        /**
             * @brief Removes the transform component from an entity.
             * @param ID The entity ID.
             */
        void removeTransformComp(size_t ID);

        /**
         * @brief Removes the light component from an entity.
         * @param ID The entity ID.
         */
        void removeLightComp(size_t ID);

        /**
         * @brief Removes the render component from an entity.
         * @param ID The entity ID.
         */
        void removeRenderComp(size_t ID);

        /**
         * @brief Removes the script component from an entity.
         * @param ID The entity ID.
         */
        void removeScriptComp(size_t ID);

        /**
         * @brief Retrieves the script component of an entity.
         * @param ID The entity ID.
         * @return The script component if available.
         */
        std::optional<ScriptComponent>& getScriptComponent(size_t ID);

        /**
         * @brief Retrieves the transform component of an entity.
         * @param ID The entity ID.
         * @return The transform component if available.
         */
        std::optional<TransformComponent>& getTransformComponent(size_t ID);

        /**
         * @brief Retrieves the render component of an entity.
         * @param ID The entity ID.
         * @return The render component if available.
         */
        std::optional<RenderComponent>& getRenderComponent(size_t ID);

    private:
        friend class RenderSystem;
        friend class Editor;

        friend void UpdateRenderSystem(EntityManager& em, Camera& cam, ShaderProgram& shader, glm::ivec2 screen, bool shadow);
        friend void UpdateTransformSystem(EntityManager& em);
        friend void UpdateScriptingSystem(EntityManager& em);
        friend void UpdateLightSystem(EntityManager& em, ShaderProgram& lit_shader, Camera& cam);

        friend bool Entity::hasLightComp() const;

        std::vector<std::optional<ScriptComponent>> scriptComps;
        std::vector<std::optional<TransformComponent>> transformComps;
        std::vector<std::optional<RenderComponent>> renderComps;
        std::vector<std::optional<MeshComponent>> meshComps;
        std::vector<std::optional<LightComponent>> lightComps;
        std::vector<std::optional<BasicComponent>> basicComps;

        std::vector<Entity> activeEntities; /**< List of active entities. */
        size_t lastEntity = 0; /**< ID of the last created entity. */

        MOVABLE_BUT_NOT_COPYABLE(EntityManager);
    };

 
    /**
     * @brief Selects an entity based on a raycast from the mouse position.
     * @param ecs Pointer to the EntityManager managing the entities.
     * @param cam Reference to the camera used for picking.
     * @param mousePos The mouse position in screen coordinates.
     * @param screenSize The size of the screen in pixels.
     * @return The ID of the picked entity or -1 if no entity was selected.
     */
    int pickEntity(const std::unique_ptr<EntityManager>& ecs, Camera& cam, glm::vec2 mousePos, glm::ivec2 screenSize);

    /**
     * @brief Checks if a ray intersects a sphere.
     * @param rayOrigin The origin of the ray.
     * @param rayDir The normalized direction of the ray.
     * @param sphereCenter The center of the sphere.
     * @param sphereRadius The radius of the sphere.
     * @param distance Output parameter that stores the distance from the ray origin to the intersection point.
     * @return True if an intersection occurs, false otherwise.
     */
    bool intersectRaySphere(const glm::vec3& rayOrigin, const glm::vec3& rayDir, const glm::vec3& sphereCenter, float sphereRadius, float& distance);
}


#endif