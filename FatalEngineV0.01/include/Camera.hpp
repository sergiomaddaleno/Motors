#ifndef CAMERA_H
#define CAMERA_H 1

namespace RMPH
{
    class Camera
    {
    public:

        enum View {
            Perspectiva,
            Ortográfica
        };

        float MovementSpeed;
        float MouseSensitivity;
        float ViewSensitivity;
        float Zoom;
        View look;

        Camera(float SMouse, float CameraZoom, float SpeedCam, float SView, View lk);

        void ProcessMouseScroll(float yoffset);
    };
}

#endif
