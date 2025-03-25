#ifndef RENDER_HPP
#define RENDER_HPP

#include <GL/glew.h>
#include <memory>
#include <vector>
#include <random>
#include <glm/glm.hpp>

class EntityManager;
class ComponentManager;
class Shader;
class Camera;
class SkyboxManager;

class RenderSystem {
public:

	RenderSystem(bool screenMode, int windowWidth, int windowHeight);
	~RenderSystem();

	GLuint globalOutputTex;

	void render(EntityManager& em, ComponentManager& componentManager, 
						const std::shared_ptr<Shader>& geometryShader,
						const std::shared_ptr<Shader>& lightingShader, 
						const std::shared_ptr<class Shader>& shadowShader, 
						const std::shared_ptr<class Shader>& ssaoShader,
						const std::shared_ptr<class Shader>& ssaoShaderBlur,
						const std::shared_ptr<class Shader>& skyboxShader,
						const std::shared_ptr<class Shader>& cloudShader,
						SkyboxManager& skybox, Camera& camera);

	// EDITOR SETTINGS
	int textureType;
	bool screenMode;
	int skyboxSelector;
	bool bSkybox;
	bool bClouds;
	float samples = 6.0f;
	float offset = 1.0f;
	float shadowStrength = 0.35f;

	struct CloudSettings {
		// Propiedades de apariencia
		glm::vec3 color = glm::vec3(0.7f, 0.7f, 0.7f);  // Color blanco ligeramente azulado
		float density = 1.0f;                            // Densidad general de las nubes
		float scale = 0.05f;                              // Escala de los detalles
		float speed = 0.15f;                             // Velocidad de movimiento

		// Cobertura y distribución
		float coverage = 0.6f;                           // Porcentaje del cielo cubierto (0-1)
		float height = 2000.0f;                          // Altura base de la capa de nubes
		float thickness = 500.0f;                        // Grosor vertical de la capa

		// Parámetros avanzados (opcionales)
		float detailScale = 5.0f;                        // Escala para detalles finos
		float absorption = 0.1f;                         // Tasa de absorción de luz
		float scattering = 0.2f;                         // Intensidad de dispersión de luz

		// Ajustes de calidad
		int steps = 64;                                  // Pasos de raymarching para calidad
	} cloudSettings;
private:

	void createGBuffer(int windowWidth, int windowHeight);
	void createDepthTexture(int width, int height);
	void createGlobalRenderBuffer(int windowWidth, int windowHeight);

	void shadowPass(EntityManager& em, ComponentManager& componentManager, const std::shared_ptr<Shader>& shadowShader);
	void geometryPass(EntityManager& em, ComponentManager& componentManager, const std::shared_ptr<Shader>& shader, Camera& camera);
	void depthPass();
	void lightingPass(EntityManager& em, ComponentManager& componentManager, const std::shared_ptr<Shader>& lightingShader, Camera& camera);
	void renderEntities(EntityManager& em, ComponentManager& componentManager, const std::shared_ptr<Shader>& shader);
	void renderQuad();

	GLuint quadVAO = 0, quadVBO = 0;

	int windowWidth, windowHeight;

	// G-BUFFER
	GLuint gBuffer;
	GLuint gPosition, gNormal, gAlbedo;
	GLuint rboDepth;

	//Depth
	GLuint depthFBO;
	GLuint depthTexture;               

	GLuint outputBuffer;

	//Shadow Mapping
	void createShadowMapCube(int resolution);
	GLuint shadowCubeFBO;
	GLuint shadowCubeMap;

	//SSAO
	GLuint ssaoFBO, ssaoColorBuffer;
	GLuint ssaoBlurFBO, ssaoBlurBuffer;

	GLuint noiseTexture;
	std::vector<glm::vec3> ssaoKernel;

	void createSSAOFramebuffers(int width, int height);
	void generateSSAOKernelAndNoise();
	void ssaoPass(const std::shared_ptr<Shader>& ssaoShader, Camera& camera);
	void ssaoBlurPass(const std::shared_ptr<Shader>& ssaoBlurShader, Camera& camera);

	//CLOUDS
	GLuint cloudFBO;
	GLuint cloudTexture;
	GLuint noiseTexture3D;
	int noiseResolution;

	void createCloudBuffers(int width, int height);
	void createNoiseTexture3D(int resolution = 128);
	void cloudPass(const std::shared_ptr<Shader>& cloudShader, Camera& camera);
	void blendClouds();

};

#endif