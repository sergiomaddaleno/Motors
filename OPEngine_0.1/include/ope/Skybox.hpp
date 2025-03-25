#ifndef SKYBOX_HPP
#define SKYBOX_HPP

#include <GL/glew.h>
#include <memory>
#include <vector>
#include <string>

class Shader;
class Camera;

class Skybox {
public: 
    Skybox();
    ~Skybox();

    GLuint skyboxVAO, skyboxVBO;
    GLuint cubemapTexture;


    Skybox(Skybox&& other) noexcept;
    Skybox& operator=(Skybox&& other) noexcept;

    Skybox(const Skybox&) = delete;
    Skybox& operator=(const Skybox&) = delete;
};


class SkyboxManager {
public:

    SkyboxManager() {};

    void add(const std::vector<std::string>& faces);
    void loadCubemap(const std::vector<std::string>& faces, Skybox& skybox);
    void render(const std::shared_ptr<Shader>& skyboxShader, Camera& camera, int skyboxSelected);

    std::vector<Skybox> skyboxes;
};

#endif