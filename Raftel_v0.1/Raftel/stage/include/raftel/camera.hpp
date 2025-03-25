#ifndef __CAMERA_H__
#define __CAMERA_H__ 1

#include <raftel/global_macros.hpp>
#include <glm/mat4x4.hpp>
#include <memory>
#include <glm/gtc/quaternion.hpp>  
#include "raftel/input.hpp"

struct GLFWwindow;

namespace Raftel {

    class Window;
    class ShaderProgram;
    /**
     * @brief Enum representing different camera states.
     */
    enum class CameraState {
        Normal,    /**< Standard camera mode. */
        Possessed  /**< User-controlled camera mode. */
    };

    /**
    * @brief Camera class for handling movement and view transformations.
    */
    class Camera {
    public:
        /**
         * @brief Constructs a Camera object.
         * @param inputRef Pointer to the input handler.
         */
        Camera(Raftel::Input* inputRef);

        /**
         * @brief Gets the current movement speed of the camera.
         * @return The movement speed.
         */
        float getMovementSpeed() const;

        /**
         * @brief Gets the current position of the camera.
         * @return The camera position.
         */
        glm::vec3 getPosition() const;

        /**
        * @brief Gets the current rotation of the camera.
        * @return The camera rotation (pitch, yaw, roll).
        */
        glm::vec3 getRotation() const;

        /**
        * @brief Gets the view matrix of the camera.
        * @return The view matrix.
        */
        glm::mat4 getViewMatrix() const;      

        /**
        * @brief Gets the projection matrix of the camera.
        * @return The projection matrix.
        */
        glm::mat4 getProjectionMatrix() const;

        /**
         * @brief Sets the position of the camera.
         * @param position The new position.
         */
        void SetPosition(const glm::vec3& position);

        /**
         * @brief Sets the rotation of the camera.
         * @param rotation The new rotation angles.
         */
        void SetRotation(const glm::vec3& rotation);

        /**
        * @brief Updates the camera's transformation matrices.
        * @param window The window reference used for retrieving screen size.
        */
        void Update(const std::unique_ptr<Window>& window);

        /**
        * @brief Sets shader uniforms related to the camera.
        * @param prg Shader program to update.
        */
        void setUniforms(ShaderProgram& prg);

        /**
         * @brief Moves the camera by a given translation vector.
         * @param translation The translation vector.
         */
        void Translate(const glm::vec3& translation);
        /**
         * @brief Rotates the camera around an axis.
         * @param angle Rotation angle in degrees.
         * @param axis Rotation axis.
         */
        void Rotate(float angle, const glm::vec3& axis);

        /**
        * @brief Sets the camera state.
        * @param newState The new state to set.
        * @param window The GLFW window reference.
        */
        void SetState(CameraState newState, GLFWwindow* window);

        /**
        * @brief Gets the current camera state.
        * @return The camera state.
        */
        CameraState GetState() const;

        /**
        * @brief Toggles the camera state using a keyboard key.
        * @param window Reference to the window.
        * @param key_ Key used to toggle the state.
        */
        void ToggleState(Raftel::Window* window, Raftel::Input::Keys key_);

        /**
         * @brief Toggles the camera state using a mouse button.
         * @param window Reference to the window.
         * @param button_ Mouse button used to toggle the state.
         */
        void ToggleState(Raftel::Window* window, Raftel::Input::Buttons button_);

        /**
         * @brief Changes camera movement speed when a specific key is pressed.
         * @param window Reference to the window.
         * @param key_ Key used to adjust the speed.
         * @param fastSpeed Speed when the key is held.
         * @param normalSpeed Default speed when the key is not held.
         */
        void ChangeSpeedWithKey(Raftel::Window* window, Raftel::Input::Keys key_,float fastSpeed = 5.0f, float normalSpeed = 2.0f);

        /**
         * @brief Adjusts camera movement speed using mouse scroll input.
         * @param window Reference to the window.
         * @param speedOffset The speed adjustment factor.
         */
        void ChangeSpeedWithScroll(Raftel::Window* window, float speedOffset);

        /**
         * @brief Processes user input when the camera is in possessed mode.
         * @param window Reference to the window.
         */
        void PossessedInput(Raftel::Window* window);

    private:
        Raftel::Input* input; /**< Pointer to the input handler. */

        glm::mat4 transform; /**< Transformation matrix. */
        glm::mat4 projection; /**< Projection matrix. */
        glm::mat4 view; /**< View matrix. */

        float near; /**< Near clipping plane. */
        float far; /**< Far clipping plane. */
        float aspectRatio; /**< Aspect ratio of the camera. */
        float FOV; /**< Field of view in degrees. */

        glm::vec3 inputMovement; /**< Movement input vector. */
        glm::vec3 inputRotation; /**< Rotation input vector. */

        float movementSpeed; /**< Movement speed of the camera. */
        float rotationSpeed; /**< Rotation speed of the camera. */

        CameraState state; /**< Current camera state. */
        glm::quat orientation = glm::quat(1.0, 0.0, 0.0, 0.0); /**< Camera orientation quaternion. */

        glm::vec3 cameraPosition; /**< Camera position in world space. */
        float yawAngle = 0.0f; /**< Yaw angle in degrees. */
        float pitchAngle = 0.0f; /**< Pitch angle in degrees. */
    };
}
#endif