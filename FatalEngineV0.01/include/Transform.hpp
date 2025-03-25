#ifndef __FATAL_TRANSFORM_HPP__
#define __FATAL_TRANSFORM_HPP__ 1

#include <glm/glm.hpp>
#include <glm/gtc/quaternion.hpp>
#include <glm/gtx/quaternion.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <algorithm>

namespace RMPH {

    enum Movements {
        FORWARD,
        BACKWARD,
        LEFT,
        RIGHT
    };

    class Transform2D {
    public:
        Transform2D();
        Transform2D(glm::vec2 pos, glm::vec2 scale, float rotation);
        ~Transform2D();

        // Methods
        void Translate(glm::vec2 direction);
        void Scale();
        void Rotate();

        // Getters
        glm::vec2 GetPosition() const { return position_; }
        glm::vec2 GetScale() const { return scale_; }
        float GetRotation() const { return rotation_; }

    private:
        glm::vec2 position_;
        glm::vec2 scale_;
        float rotation_;
    };

    class Transform3D {
    public:
        // Constructors & Destructors
        Transform3D();
        Transform3D(glm::vec3 pos, glm::vec3 scale, glm::vec3 rotation);
        ~Transform3D();

        // Methods
        void Translate(glm::vec3 direction);
        void Scale(glm::vec3 scale);
        void Rotate(glm::vec3 degrees);

        glm::mat4 ApplyTranformation();

        // Getters
        glm::vec3 GetFront();
        glm::vec3 GetUp();
        glm::vec3 GetRight();
        glm::vec3 GetPosition();
        glm::vec3 GetScale();
        glm::vec3 GetRotation();
        glm::mat4 GetViewMatrix();

    private:
        // Attributes
        glm::vec3 position_;
        glm::vec3 scale_;
        glm::vec3 rotation_;
        glm::vec3 front_;
        glm::vec3 up_;
        glm::vec3 right_;

        void updateVectors();
    };
}

#endif // __FATAL_TRANSFORM_HPP__
