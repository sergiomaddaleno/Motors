#ifndef CHARACTERCONTROLLER_HPP
#define CHARACTERCONTROLLER_HPP

#include <iostream>

using Entity = std::uint32_t;
class ComponentManager;
class TransformComponent;
class Input;

class CharacterController {
public:

    CharacterController(Entity entity, ComponentManager& cm, Input& input);

    void move();

    ~CharacterController(){}

private:
    Entity entity;
    Input* input;
    ComponentManager* componentManager;
    TransformComponent* transform;
};

#endif 
