#ifndef TRANSFORM_HPP
#define TRANSFORM_HPP

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/quaternion.hpp>
#include <glm/gtx/quaternion.hpp>

class EntityManager;
class ComponentManager;

class TransformComponent {
public:
    glm::vec3 position;
    glm::vec3 rotation;
    glm::vec3 scale;

    float verticalDirection;
    float horizontallDirection;

    TransformComponent(
        const glm::vec3& pos = glm::vec3(0.0f),
        const glm::vec3& rot = glm::vec3(0.0f),
        const glm::vec3& scl = glm::vec3(1.0f));

    glm::mat4 getTransformationMatrix() const;

    void setPosition(const glm::vec3& newPos);
    void setRotation(const glm::vec3& newRot);
    void setScale(const glm::vec3& newScale);

    ~TransformComponent() {}
};

class TransformSystem {
public:
    TransformSystem();
    ~TransformSystem();

    void update(EntityManager& em, ComponentManager& componentManager, float deltaTime);
};

#endif