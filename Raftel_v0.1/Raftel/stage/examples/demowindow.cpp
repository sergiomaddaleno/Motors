#include "raftel/window.hpp"
#include "raftel/shader.hpp"
#include "raftel/ecs.hpp"
#include "raftel/camera.hpp"
#include "raftel/imguiRenderer.hpp"
#include "raftel/systems.hpp"
#include "raftel/input.hpp"
#include "raftel/imguiWindows.hpp"
#include <fstream>
#include <string>




int main(void)
{
	// create window system and wyndow
    auto windowSystemOpt = Raftel::WindowSystem::make();
    auto windowOpt = Raftel::Window::make("WindowTest", *windowSystemOpt);
	if (!windowOpt) {
		std::cerr << "Can't create window\n";
		return -1;
	}

	// make window context
	windowOpt->MakeContextCurrent();

	// create input
    Raftel::Input input(windowOpt->window_);

	//create core shader
	Raftel::ShaderProgram shader;
	if (!shader.load("../assets/shaders/lit.vs", "../assets/shaders/lit.fs")) {
		std::cerr << "Error al cargar los shaders.\n";
		return -1;
	}

	// movable camera
	Raftel::Camera cam(&input);

	// to create and show entities you need create entity system (ecs)
	auto ecs = std::make_unique<Raftel::EntityManager>();

	// we will create a entity terrain 
	// create entity
	auto terrain = ecs->CreateEntity();

	// create texture and mesh
	auto cube_t = Raftel::Texture::loadTexture("../assets/textures/cubetex.png");
	auto terrainMesh = Raftel::MeshFactory::createTerrain("../assets/heightmap/heightMap_test3.png", 1.0f, 200.0f, true);
	terrainMesh->GetMaterialByIndex(0)->setAlbedo(cube_t);
	terrainMesh->setupMesh();

	// add components to the entity
	terrain.addMeshComp(terrainMesh);
	terrain.addRenderComp(true);
	terrain.addTransformComp(Raftel::TransformComponent{
		glm::vec3(0.0f, -200.0f, -400.0f),
		glm::vec3(0.0f),
		glm::vec3(1.0f)
		});

	//add some light
	 auto spotLightEntity = ecs->CreateEntity();
    spotLightEntity.addLightComp(Raftel::LightComponent(
        Raftel::LightComponent::LightType::SPOT,
        glm::vec3(1.0f, 0.8f, 0.6f),
        1.0f, 1000.0f, 20.0f, 30.0f,
        windowOpt->getScreenSize()));
    spotLightEntity.addMeshComp(Raftel::MeshFactory::createSphere(2.0f, 20));
    spotLightEntity.addRenderComp(true);
    spotLightEntity.addTransformComp({ glm::vec3(200.0f, -60.0f, -400.0f), glm::vec3(90.0f, 0.0f, 0.0f), glm::vec3(10.0f) });


	//our engine has ImGui support, if you want to use it, only need create:
	Raftel::imguiRenderer ImguiRender(windowOpt->window_);
	//and update each frame
	//also we have a editor class that you can manage some things
	Raftel::Editor editor;
	while (!windowOpt->ShouldClose())
	{
		//update input
		input.updateKeys();

		//camera controls
		cam.ChangeSpeedWithScroll(windowOpt.get(), 1.0f);
		cam.PossessedInput(windowOpt.get());
		cam.ToggleState(windowOpt.get(), Raftel::Input::Buttons::Mouse_Right);

		windowOpt->clear();

		//update camera
		cam.Update(windowOpt);

		//render system -> render the entities that you create in the ecs
		Raftel::RenderSystem::UpdateRenderSystem(*ecs, cam, shader, windowOpt->getScreenSize(), true);
		ImguiRender.newFrame();
		//ImGui functions between this one, like:
		editor.Show(cam, *ecs);
		ImguiRender.endFrame();

		windowOpt->swapBuffers();
	}


    return 0;
}