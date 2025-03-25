#ifndef CAMERA_HPP
#define CAMERA_HPP

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/constants.hpp>

class Input;

class Camera {
public:
    glm::vec3 position;      // Posición de la cámara
    glm::vec3 front;         // Dirección hacia donde mira la cámara
    glm::vec3 up;            // Vector "arriba" de la cámara
    glm::vec3 right;         // Vector perpendicular a front y up
    glm::vec3 worldUp;       // Vector global "arriba"

    float yaw;               // Rotación en el eje Y (horizontal)
    float pitch;             // Rotación en el eje X (vertical)

    float fov;               // Campo de visión (en grados)
    float aspectRatio;       // Relación de aspecto de la pantalla
    float nearPlane;         // Plano cercano de la proyección
    float farPlane;          // Plano lejano de la proyección

    float cameraSpeed;       // Velocidad de movimiento de la cámara
    float mouseSensitivity;  // Sensibilidad del ratón

    float ambientOclussionStrenght;

    Camera(Input* input, glm::vec3 position, float yaw, float pitch, float fov, float aspectRatio, float nearPlane, float farPlane);

    glm::mat4 getViewMatrix() const;
    glm::mat4 getProjectionMatrix() const;

    void move(glm::vec3 direction, float delta);
    void rotate(float deltaYaw, float deltaPitch);

    void update(float delta);
    glm::vec3 getPosition() const;

private:

    Input* input;

    double lastX = 400, lastY = 300;
    bool firstMouse = true;
    bool wasShiftPressed = false;

    void updateCameraVectors();
};

#endif