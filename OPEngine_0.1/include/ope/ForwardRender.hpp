#ifndef RENDER_HPP
#define RENDER_HPP

#include <GL/glew.h>
#include <memory>
#include "ope/ECSManager.hpp"
#include "ope/Components.hpp"


class Shader;
class Camera;
class SkyboxManager;

class ForwardRenderSystem {
public:

    ForwardRenderSystem(int windowWidth, int windowHeight);
    ~ForwardRenderSystem();

    void forwardRender(EntityManager& em, ComponentManager& componentManager,
        const std::shared_ptr<Shader>& lightShader,
        const std::shared_ptr<Shader>& shadowShader,
        Camera& camera, glm::mat4 lightSpaceMatrix,
        const std::shared_ptr<Shader>& skyboxShader, 
        SkyboxManager& skyboxManager);  

    glm::mat4 GetLightSpaceMatrix(glm::vec3 lightPos, int lightType, glm::vec3 lightDirection);
    void RenderDepthMap(EntityManager& em, ComponentManager& componentManager, std::shared_ptr<Shader> shadowShader, glm::mat4 lightSpaceMatrix);
    void shadowPass(EntityManager& em, ComponentManager& componentManager, const std::shared_ptr<Shader>& shadowShader);
    void createShadowMapCube(int resolution);
    void CreateSpotLightShadowMap();

private:
    void renderEntities(EntityManager& em, ComponentManager& componentManager,
        const std::shared_ptr<Shader>& shader,
        const std::shared_ptr<std::vector<std::tuple<Entity, ColorComponent>>>& colorVector);
    void SetupShadowMap();

    GLuint shadowMapFBO;
    GLuint shadowMap;
    //float near_plane = 0.1f, far_plane = 500.0f;

    GLuint shadowCubeFBO;
    GLuint shadowCubeMap;

    GLuint spotShadowFBO, spotShadowMap;
    const unsigned int SHADOW_WIDTH = 1024, SHADOW_HEIGHT = 1024;
    GLuint quadVAO = 0, quadVBO = 0;
    int windowWidth, windowHeight;

    // Variables para el Skybox
    bool bSkybox;  
    int skyboxSelector;  

    float near_plane;
    float far_plane;

    float cutOff;
};

#endif