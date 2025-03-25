#ifndef ECSMANAGER_HPP
#define ECSMANAGER_HPP

#include <iostream>
#include <unordered_map>
#include <vector>
#include <memory>
#include <typeindex>
#include <typeinfo>
#include <optional>
#include <tuple>
#include <cassert>
#include <algorithm>

using Entity = std::uint32_t;

class EntityManager {
public:
    Entity createEntity() {
        return entityCount++;
    }

    Entity entityCount = 0;
};

class ComponentManager {
public:
    template <typename T>
    void addComponent(Entity entity, T component) {

        const std::type_index typeIndex = std::type_index(typeid(T));

        if (componentPools.find(typeIndex) == componentPools.end()) {
            componentPools[typeIndex] = std::make_shared<std::vector<std::tuple<Entity, T>>>();
        }

        auto componentVectorContainer = componentPools[typeIndex];
        auto componentVector = std::static_pointer_cast<std::vector<std::tuple<Entity, T>>>(componentVectorContainer);

        auto it = std::find_if(componentVector->begin(), componentVector->end(), 
        [entity](const std::tuple<Entity, T>& entry) {
            return std::get<0>(entry) == entity;
        });

        if (it != componentVector->end()) {
            printf("\n [!!!] Warning-> Entity: %d, has a repeating component. The first component will be used.\n", entity);
        }

        componentVector->emplace_back(entity, std::move(component));

        // Reordenar Vector
        std::sort(componentVector->begin(), componentVector->end(),
        [](const std::tuple<Entity, T>& a, const std::tuple<Entity, T>& b) {
            return std::get<0>(a) < std::get<0>(b);
        });
    } 

    template <typename T>
    T* getComponent(Entity entity) {

        const std::type_index typeIndex = std::type_index(typeid(T));

        if (componentPools.find(typeIndex) != componentPools.end()) {
            auto componentVectorContainer = componentPools[typeIndex];
            auto componentVector = std::static_pointer_cast<std::vector<std::tuple<Entity, T>>>(componentVectorContainer);
            
            auto it = std::find_if(componentVector->begin(), componentVector->end(),
            [entity](const std::tuple<Entity, T>& entry) {
                return std::get<0>(entry) == entity;
            });

            if (it != componentVector->end()) {
           
                return &std::get<1>(*it);
            }
        }

        return nullptr;
    }

    std::unordered_map<std::type_index, std::shared_ptr<void>> componentPools;
};


#endif 


