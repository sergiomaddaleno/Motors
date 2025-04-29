#include <GL/glew.h>
#include <glm/mat4x4.hpp>
#include <glm/ext/matrix_transform.hpp> // glm::translate, glm::rotate, glm::scale
#include <glm/ext/matrix_clip_space.hpp> // perspective
#include <glm/gtc/type_ptr.hpp>

#include <stdlib.h>

#include "WindowSystem.hpp"
#include "Window.hpp"
#include "Input.hpp"
#include "ECS/Component.hpp"
#include "ECS/System.hpp"
#include "ECS/ECSManager.hpp"
#include "Imgui.hpp"

float jumpVelocity = 0.0f;
float gravity = -700.0f;
float jumpForce = 530.0f;
bool isJumping = false;
float speed = 0.05f;
float hor_speed = 200.0f;
float floor_height = 0.0f;

float spawn_delay = 3.0f;
static float spawnTimer = 0.0f;
std::vector<Entity> obstacles;

bool isOnRoad(glm::vec3 playerPos, glm::vec3 leftRoadPos, glm::vec3 middleRoadPos, glm::vec3 rightRoadPos) {
    float tolerance_x = 50.0f;
    float tolerance_y = 1.0f; 

    bool isOverRoad = (glm::abs(playerPos.x - leftRoadPos.x) < tolerance_x ||
        glm::abs(playerPos.x - middleRoadPos.x) < tolerance_x ||
        glm::abs(playerPos.x - rightRoadPos.x) < tolerance_x);

    float roadHeight = -1.0f;
    bool isAtRoadHeight = glm::abs(playerPos.y - roadHeight) < tolerance_y;

    return isOverRoad && isAtRoadHeight;
}

bool checkCollision(const glm::vec3& pos1, const glm::vec3& scale1, const glm::vec3& pos2, const glm::vec3& scale2) {
    float collisionScaleFactor = 3.0f;

    float halfWidth1 = (scale1.x / 2.0f) * collisionScaleFactor;
    float halfHeight1 = (scale1.y / 2.0f) * collisionScaleFactor;
    float halfDepth1 = (scale1.z / 2.0f) * collisionScaleFactor;

    float halfWidth2 = (scale2.x / 2.0f) * collisionScaleFactor;
    float halfHeight2 = (scale2.y / 2.0f) * collisionScaleFactor;
    float halfDepth2 = (scale2.z / 2.0f) * collisionScaleFactor;

    bool collisionX = abs(pos1.x - pos2.x) < (halfWidth1 + halfWidth2);
    bool collisionY = abs(pos1.y - pos2.y) < (halfHeight1 + halfHeight2);
    bool collisionZ = abs(pos1.z - pos2.z) < (halfDepth1 + halfDepth2);

    return collisionX && collisionY && collisionZ;
}

int main() {
    auto WS = WindowSystem::make();
    auto window = Window::make(LUQUI_Window_Width, LUQUI_Window_Height, "LUQUI");
    if (nullptr == window->window) {
        return -1;
    }
    srand((unsigned int)time(NULL));
    window->setCurrentWindowActive();

    // Declaramos un gestor de input asociado a la ventana en activo.
    Input input(window->window);

    ///////START OF PROGRAM & SHADERS/////
    /** Creating shaders */
    Shader vertex = Shader();
    if (!vertex.loadFromFile(Shader::ShaderType::kShaderType_Vertex, "../data/Shaders/vertex.vs")) {
        std::cerr << "Error al cargar el vertex shader desde archivo." << std::endl;
        return -2;
    }
    if (!vertex.compile()) {
        std::cerr << "Error al compilar el vertex shader." << std::endl;
        return -3;
    }

    Shader fragment = Shader();
    if (!fragment.loadFromFile(Shader::ShaderType::kShaderType_Fragment, "../data/Shaders/fragment.fs")) {
        std::cerr << "Error al cargar el fragment shader desde archivo." << std::endl;
        return -4;
    }
    if (!fragment.compile()) {
        std::cerr << "Error al compilar el fragment shader." << std::endl;
        return -5;
    }
    /** Creating Program */
    Program program = Program();
    program.attach(&vertex);
    program.attach(&fragment);
    if (!program.link()) {
        std::cout << "Error al linkar el programa" << std::endl;
        return -4;
    }
    ///////END OF PROGRAM & SHADERS/////


    // Creamos un gestor de entidades
    ECSManager ecsmanager;

    // Declaramos los sistemas que se utilizar�n en el programa.
    RenderSystem renderSystem;
    InputSystem inputSystem;

    // Crear listas de componentes
    ecsmanager.addComponentType<TransformComponent>();
    ecsmanager.addComponentType<InputComponent>();
    ecsmanager.addComponentType<RenderComponent>();
    ecsmanager.addComponentType<LightComponent>();
    ecsmanager.addComponentType<CameraComponent>();
    ecsmanager.addComponentType<NameComponent>();

    //Camera Entity
    Entity CameraEntity = ecsmanager.createEntity();
    ecsmanager.addComponent<CameraComponent>(CameraEntity);
    ecsmanager.editComponent<CameraComponent>(CameraEntity, [](CameraComponent& camera) {
        camera.position = glm::vec3(0.0f, 300.0f, 300.0f);
        camera.updateViewMatrix();
        });

    ecsmanager.addComponent<InputComponent>(CameraEntity);
    ecsmanager.editComponent<InputComponent>(CameraEntity, [](InputComponent& input) {
        input.active = true;
        input.followingMouse = true;
        });

    // Crear una entidad para la luz
    Entity lightEntity = ecsmanager.createEntity();

    ecsmanager.editComponent<LightComponent>(lightEntity, [](LightComponent& light) {
        light.type = LightType::Directional; // Tipo de luz (Point Light)
        light.color = glm::vec3(1.0f, 1.0f, 1.0f); // Color de la luz (RGB)
        light.position = glm::vec3(20.0f, 100.0f, 0.0f); // Posición de la luz
        light.direction = glm::vec3(1.0f, -21.0f, -0.0f);
        light.intensity = 2.0f; // Intensidad de la luz
        light.radius = 250.0f; // Radio de influencia de la luz
        });


    auto cube_mesh = std::make_shared<Model>("../data/Models/cube/cube.obj", "cube");
    auto ship_mesh = std::make_shared<Model>("../data/Models/ship/ship.obj", "ship");

    ecsmanager.resources.push_back(ship_mesh);
    ecsmanager.resources.push_back(cube_mesh);

    Entity modelEntity1 = ecsmanager.createEntity();

    ecsmanager.editComponent<TransformComponent>(modelEntity1, [](TransformComponent& transform) {
        transform.position = { 0.0f, 0.0f, 0.0f };
        transform.scale = { 10.0f, 10.0f, 10.0f };
        transform.rotation = { 0, 90.0f, 0 };
        });

    ecsmanager.editComponent<RenderComponent>(modelEntity1, [&](RenderComponent& modelComp) {
        modelComp.model = ship_mesh;
        });

    // ---

    Entity RightPath = ecsmanager.createEntity();
    Entity LeftPath = ecsmanager.createEntity();
    Entity MiddlePath = ecsmanager.createEntity();

    ecsmanager.editComponent<TransformComponent>(RightPath, [=](TransformComponent& transform) {
        transform.position = { -300.0f, -100.0f, -800.0f };
        transform.scale = { 50.0f, 50.0f, 800.0f };
        });

    ecsmanager.editComponent<RenderComponent>(RightPath, [&](RenderComponent& modelComp) {
        modelComp.model = cube_mesh;
        });

    ecsmanager.editComponent<TransformComponent>(LeftPath, [=](TransformComponent& transform) {
        transform.position = { 300.0f, -100.0f, -800.0f };
        transform.scale = { 50.0f, 50.0f, 800.0f };
        });

    ecsmanager.editComponent<RenderComponent>(LeftPath, [&](RenderComponent& modelComp) {
        modelComp.model = cube_mesh;
        });

    ecsmanager.editComponent<TransformComponent>(MiddlePath, [=](TransformComponent& transform) {
        transform.position = { 0.0f, -100.0f, -800.0f };
        transform.scale = { 60.0f, 60.0f, 800.0f };
        });

    ecsmanager.editComponent<RenderComponent>(MiddlePath, [&](RenderComponent& modelComp) {
        modelComp.model = cube_mesh;
        });

    // ---

    //////////////////////////////////

    LuquiImgui LuquiImgui(&window.value());

    // Ciclo del juego
    while (!window->isOpen()) {
        static double lastTime = glfwGetTime();
        double currentTime = glfwGetTime();
        float deltaTime = static_cast<float>(currentTime - lastTime);
        lastTime = currentTime;
        spawnTimer += deltaTime;

        LuquiImgui.NewFrame();

        float rotation = glm::radians((float)glfwGetTime() * 100.0f);
        //glEnable(GL_COLOR_BUFFER_BIT);
        for (Entity entity = 1; entity < ecsmanager.get_nextEntity(); ++entity)
        {
            if (auto transformOpt = ecsmanager.getComponent<TransformComponent>(entity))
            {
                RenderSystem::UpdateTransformMatrix(*transformOpt.value());
            }
        }
        // Limpiar la pantalla
        glClearColor(0.4, 0.4, 0.4, 1.0);
        glFrontFace(GL_CCW);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT | GL_STENCIL_BUFFER_BIT);
        glEnable(GL_DEPTH_TEST);
        glDepthFunc(GL_LEQUAL);
        glDepthMask(true);
        glEnable(GL_CULL_FACE);
        glCullFace(GL_BACK);
        glEnable(GL_BLEND);
        glBlendFunc(GL_ONE, GL_ZERO);


        LuquiImgui.EntityWindows(ecsmanager);

        program.use();
        glm::mat4x4 model, view, projection;
        model = glm::mat4(1.0f);
        view = glm::mat4(1.0f);
        projection = glm::mat4(1.0f);

        // Gestion de camara
        auto cameraComponent = ecsmanager.getComponent<CameraComponent>(CameraEntity);
        auto inputComp = ecsmanager.getComponent<InputComponent>(CameraEntity);
        if (cameraComponent) {
            if (inputComp)
                inputSystem.update(inputComp.value(), cameraComponent.value(), input, 0.016f);

            //cameraComponent.value()->updatePosition(transformOpt.value());
            //cameraComponent.value()->updateForward(transformOpt.value());
            // Usa las matrices de la cámara del componentec

            cameraComponent.value()->updateViewMatrix();
            cameraComponent.value()->updateProjectionMatrix();
            view = cameraComponent.value()->view;
            projection = cameraComponent.value()->projection;
        }

        for (Entity Light_entity = 1; Light_entity < ecsmanager.get_nextEntity(); ++Light_entity) {
            // Configurar la luz en el shader
            if (!ecsmanager.isEntityAlive(Light_entity)) continue;
            auto lightOpt = ecsmanager.getComponent<LightComponent>(Light_entity);
            if (!lightOpt.has_value()) continue;
            if (lightOpt && lightOpt.value()->type == LightType::Point) {
                //GLuint pointLightIntensityLoc = glGetUniformLocation(program.get_id(), "pointLightIntensity");
                program.setVec3("pointLightColor", lightOpt.value()->color);
                program.setVec3("pointLightPosition", lightOpt.value()->position);
                program.setFloat("pointLightRadius", lightOpt.value()->radius);
                program.setInt("LightType", static_cast<int>(lightOpt.value()->type));
                //glUniform1f(pointLightIntensityLoc, lightOpt.value()->intensity);

            }
            if (lightOpt && lightOpt.value()->type == LightType::Spot) {
                program.setVec3("spotlightColor", lightOpt.value()->color);
                program.setVec3("spotlightPosition", lightOpt.value()->position);
                program.setVec3("spotlightDirection", lightOpt.value()->direction);
                program.setFloat("spotlightIntensity", lightOpt.value()->intensity);
                program.setFloat("spotlightCutoff", lightOpt.value()->cutoff);
                program.setFloat("spotlightOuterCutoff", lightOpt.value()->outerCutoff);
                program.setInt("LightType", static_cast<int>(lightOpt.value()->type));
            }
            if (lightOpt && lightOpt.value()->type == LightType::Directional) {
                program.setVec3("directionalLightColor", lightOpt.value()->color);
                program.setVec3("directionalLightDirection", lightOpt.value()->direction);
                program.setFloat("directionalLightIntensity", lightOpt.value()->intensity);
                program.setInt("LightType", static_cast<int>(lightOpt.value()->type));
            }
            // Renderizar todas las entidades
            for (Entity entity = 1; entity < ecsmanager.get_nextEntity(); ++entity) {
                if (!ecsmanager.isEntityAlive(entity)) continue;
                if (ecsmanager.getComponent<LightComponent>(entity).has_value()) continue;
                // Obtener los componentes de la entidad
                auto transformOpt = ecsmanager.getComponent<TransformComponent>(entity);
                auto modelOpt = ecsmanager.getComponent<RenderComponent>(entity);
                auto inputComponentOpt = ecsmanager.getComponent<InputComponent>(entity);

                if (transformOpt && modelOpt) {


                    // Pasar la matriz de modelo al shader
                    GLuint modelLoc = glGetUniformLocation(program.get_id(), "model");
                    glUniformMatrix4fv(modelLoc, 1, GL_FALSE, glm::value_ptr(transformOpt.value()->transform_matrix));

                    // Dibujar el modelo
                    renderSystem.drawModel(transformOpt.value(), modelOpt.value(), program);
                }




            }
            glBlendFunc(GL_ONE, GL_ONE);
            glDepthMask(false);
        }
        auto camera = ecsmanager.getComponent<CameraComponent>(CameraEntity).value();
        // Pasar las matrices de vista y proyección al shader
        GLuint viewLoc = glGetUniformLocation(program.get_id(), "view");
        glUniformMatrix4fv(viewLoc, 1, GL_FALSE, glm::value_ptr(view));

        GLuint projectionLoc = glGetUniformLocation(program.get_id(), "projection");
        glUniformMatrix4fv(projectionLoc, 1, GL_FALSE, glm::value_ptr(projection));


        //---

        auto modelE = ecsmanager.getComponent<TransformComponent>(modelEntity1);
        auto RightPathE = ecsmanager.getComponent<TransformComponent>(RightPath);
        auto LeftPathE = ecsmanager.getComponent<TransformComponent>(LeftPath);
        auto MiddlePathE = ecsmanager.getComponent<TransformComponent>(MiddlePath);

        modelE.value()->position.z = modelE.value()->position.z - speed;

        if (input.isKeyPressed(input.KEY_W)) {
            speed += 0.01f;
            spawn_delay -= 0.01f;
            if (speed >= 1.0f) speed = 1.0f;
            if (spawn_delay <= 0.5f) spawn_delay = 0.5f;
        }

        if (input.isKeyPressed(input.KEY_S)) {
            speed -= 0.01f;
            spawn_delay += 0.01f; 
            if (speed <= 0.05f) speed = 0.05f;
            if (spawn_delay >= 2.0f) spawn_delay = 2.0f; 
        }
        
        auto cameraE = ecsmanager.getComponent<CameraComponent>(CameraEntity);
        if (cameraE.has_value()) {
            cameraE.value()->position = glm::vec3(modelE.value()->position.x, modelE.value()->position.y + 100, modelE.value()->position.z + 200);
            RightPathE.value()->position.z = cameraE.value()->position.z;
            LeftPathE.value()->position.z = cameraE.value()->position.z;
            MiddlePathE.value()->position.z = cameraE.value()->position.z;
        }

        if (input.isKeyPressed(input.KEY_A)) {
            modelE.value()->position.x = modelE.value()->position.x - (hor_speed * deltaTime);
        }
        if (input.isKeyPressed(input.KEY_D)) {
            modelE.value()->position.x = modelE.value()->position.x + (hor_speed * deltaTime);
        }

        if (input.isKeyPressed(input.KEY_R)) {
            modelE.value()->position.y = 5.0f;
            modelE.value()->position.x = 0.0f;
        }

        if (input.isKeyPressed(input.KEY_SPACE) && !isJumping) {
            jumpVelocity = jumpForce;
            isJumping = true;
        }

        if (!isOnRoad(modelE.value()->position,
            LeftPathE.value()->position,
            MiddlePathE.value()->position,
            RightPathE.value()->position)) {
            floor_height = -1000.0f;
            isJumping = true;
        }
        else {
            floor_height = 0.0f;
        }

        if (isJumping) {
            jumpVelocity += gravity * deltaTime;
        }

        modelE.value()->position.y += jumpVelocity * deltaTime;

        if (modelE.value()->position.y <= floor_height) {
            modelE.value()->position.y = floor_height;
            isJumping = false;
            jumpVelocity = 0.0f;
        }

        if (spawnTimer >= spawn_delay) {
            spawnTimer = 0.0f;

            Entity obstacle = ecsmanager.createEntity();
            ecsmanager.addComponent<TransformComponent>(obstacle);
            ecsmanager.addComponent<RenderComponent>(obstacle);

            int lane = rand() % 3; 

            float xPos = 0.0f;
            if (lane == 0) xPos = -300.0f;
            else if (lane == 1) xPos = 0.0f;
            else if (lane == 2) xPos = 300.0f;

            if (modelE.has_value()) {
                float camZ = MiddlePathE.value()->position.z;

                ecsmanager.editComponent<TransformComponent>(obstacle, [=](TransformComponent& transform) {
                    transform.position = { xPos, 40.0f, camZ - 500.0f };
                    transform.scale = { 30.0f, 30.0f, 30.0f };
                    });

                ecsmanager.editComponent<RenderComponent>(obstacle, [&](RenderComponent& modelComp) {
                    modelComp.model = cube_mesh;
                    });

                obstacles.push_back(obstacle);
            }

        }

        for (auto it = obstacles.begin(); it != obstacles.end();) {
            auto obstacleTransformOpt = ecsmanager.getComponent<TransformComponent>(*it);
            if (!obstacleTransformOpt.has_value()) {
                it = obstacles.erase(it);
                continue;
            }

            if (modelE.has_value()) {
                glm::vec3 playerPos = modelE.value()->position;
                glm::vec3 playerScale = modelE.value()->scale;

                glm::vec3 obstaclePos = obstacleTransformOpt.value()->position;
                glm::vec3 obstacleScale = obstacleTransformOpt.value()->scale;

                if (checkCollision(playerPos, playerScale, obstaclePos, obstacleScale)) {
                    speed = 0.05f;
                }
            }
            
            ++it;
        }

        //---

        glDepthMask(true);
        glDepthFunc(GL_LESS);
        glDisable(GL_BLEND);
        program.unuse();
        // Intercambiar buffers
        LuquiImgui.Render();
        window->render();
    }

    window->~Window();
    WS->~WindowSystem();
    return 0;
}