# 3PVG_PMG_24_mazcunyabla_folgadoba
## Authors: Marc Folgado Balbás & Carlos Mazcuñán Blanes

Welcome to the 3PVG_PMG_24_mazcunyabla_folgadoba, a custom C++ graphics engine powered by OpenGL designed for high-performance rendering and flexibility in graphics programming.

## Prerequisites

Before you begin, ensure you have the following software installed on your system:

- Python (required for some build scripts)
- Conan (version < 2, for managing dependencies)
- CMake (for building the project)
- Visual Studio 2019 or 2022 (IDE for development)

## Setup and Installation

To set up the project and install necessary dependencies, follow these steps:

1. **Generate Dependencies**:
   Run the dependency generator script from the terminal:
   ```bash
   ./tools/gendeps.bat
   ```
2. **Build the Project**:
Navigate to the root directory of the project and build using Premake:
   ```bash
   premake5.exe vs2022 # or vs2019, depending on your Visual Studio version
   ```
3. **Open and Run the Solution**:
Open the generated solution file in Visual Studio located at:
   ```bash
    ./build/Raftel.sln
   ```
Build and run the solution from within the IDE.

## Features

- **Robust Rendering**: Leverage OpenGL to create stunning visuals and rendering effects.
- **Modular Architecture**: Easy to extend and customize the engine to fit specific project needs.

## Example: Loading Terrain model and Spot Light

This example demostrates how to create terrain model and display it using Raftel engine.
The following code initializes the engine, loads a model, create light and applies basic rendering techniques.

## Code

```cpp

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
		glm::vec3(0.0f),
		glm::vec3(0.0f),
		1.0f, 1000.0f, 170.0f, 200.0f,
		windowOpt->getScreenSize()));
	spotLightEntity.addMeshComp(Raftel::MeshFactory::createSphere(2.0f, 20));
	spotLightEntity.addRenderComp(true);
	spotLightEntity.addTransformComp({ glm::vec3(200.0f, -60.0f, -400.0f), glm::vec3(0.0f, 180.0f, -180.0f), glm::vec3(10.0f) });


	//our engine has ImGui support, if you want to use it, only need create:
	//Raftel::imguiRenderer ImguiRender(windowOpt->window_);
	//and update each frame
	//also we have a editor class that you can manage some things
	//Raftel::Editor editor;
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
		//ImguiRender.newFrame();
		//ImGui functions between this one, like:
		//editor.Show(cam, *ecs);
		//ImguiRender.endFrame();

		windowOpt->swapBuffers();
	}


    return 0;
}
```

## Contributing

We welcome contributions to make our engine better. If you're interested in helping, please fork the repository, make your changes, and submit a pull request. For more details, see our contributing guidelines (link to guidelines).

## License

This project is licensed under the [MIT License](LICENSE.md) - see the LICENSE file for details.

## Acknowledgments

- Thanks to everyone who has contributed to the development of this project.
- Special thanks to the OpenGL community for their invaluable resources and support.

## In Development
- Shadows in forward rendering
- Defered rendering

