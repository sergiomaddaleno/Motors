#ifndef UIRENDERER_HPP
#define UIRENDERER_HPP

#define IMGUI_IMPL_OPENGL_LOADER_CUSTOM

#include "imgui.h"
#include "../backends/imgui_impl_glfw.h"
#include "../backends/imgui_impl_opengl3.h"
#include <GLFW/glfw3.h>
#include <cstdint>

class EntityManager;
class TransformComponent;
class LightComponent;
class Camera;
class ColorComponent;
class HeightmapGenerator;
class ComponentManager;
class HeightmapGenerator;
class RenderSystem;

using Entity = std::uint32_t;

class UIRenderer {
public:

	UIRenderer(GLFWwindow* window);
	void newFrame();
	void endFrame();

	void entityViewer(EntityManager &em);
	void changeRenderTexture(int& textureType, bool& skybox, int& skyboxSelector, bool& clouds);
	void ecsDemoInfo();
	void changeMeshDemoInfo();

	//EDTORS
	void TransformEditor(TransformComponent* transform);
	void LightEditor(LightComponent* light);
	void CameraEditor(Camera& camera);
	void ColorEditor(ColorComponent* color);
	void ShadowEditor(RenderSystem& renderSystem);
	void CloudEditor(RenderSystem& renderSystem);

	void settingsWindow(Camera& camera, LightComponent* light, RenderSystem& Deferred,
						int& textureType, bool& skybox, int& skyboxSelector, bool& clouds);

	//RENDER
	void renderTextureWindow(GLuint textureID);
	void renderWindow(RenderSystem& system);

	~UIRenderer();
};

#endif