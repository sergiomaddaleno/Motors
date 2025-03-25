// Engine.hpp / Singleton
#ifndef __ENGINE_HPP__
#define __ENGINE_HPP__ 1

#include <vector>
#include <string.h>
#include <unordered_map>
#include "raftel/imguiRenderer.hpp"
//#include "raftel/ecs.hpp"

namespace Raftel {
    class Mesh;
    class Entity;
    class Engine {
    public:

        static Engine& Instance() {
            static Engine instance;
            return instance;
        }

        std::string getFileName(const std::string& path) {
            size_t lastSlashPos = path.find_last_of("/"); 
            if (lastSlashPos != std::string::npos) {
                return path.substr(lastSlashPos + 1); 
            }
            return path; 
        }

        std::vector<std::shared_ptr<Raftel::Mesh>> meshes;
        std::vector<std::shared_ptr<Raftel::Mesh>> internalMeshes;
        std::vector<std::shared_ptr<Raftel::Entity>> lights;
        std::vector<std::shared_ptr<Raftel::Entity>> point_lights;
        std::vector<std::shared_ptr<Raftel::Entity>> spot_lights;
        int numLights;
        int numEntities;


        int has_ambient_light = TRUE;
        glm::vec3 ambient_light = glm::vec3(0.1f, 0.1f, 0.1f);

        float SCREEN_W;
        float SCREEN_H;
        int selectedEntity;
    private:
        Engine() : numLights(0), numEntities(0),selectedEntity(-1), SCREEN_W(1280.0f), SCREEN_H(720.0f)  {}
        ~Engine() {}

        Engine(const Engine&) = delete;
        Engine& operator=(const Engine&) = delete;
    };
}

#endif // ENGINE_HPP
