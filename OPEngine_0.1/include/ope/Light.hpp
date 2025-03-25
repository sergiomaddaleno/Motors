#ifndef LIGHT_HPP
#define LIGHT_HPP

#include <glm/glm.hpp>
#include <string>
#include <vector>

class EntityManager;
class ComponentManager;

class LightComponent {
public:
    enum class LightType {
        Point = 0,
        Directional = 1,
        Spot = 2
    };

    LightType type;

    // Common properties for all lights
    glm::vec3 direction;
    glm::vec3 ambient;
    glm::vec3 diffuse;
    glm::vec3 specular;

    // Additional properties for Point and Spot lights
    float constant;
    float linear;
    float quadratic;

    // Additional properties for Spot lights
    float cutOff;
    float outerCutOff;

    float strength;
    float bias;
    float maxDistance;

    LightComponent(
        LightType lightType,
        const glm::vec3& dir,
        const glm::vec3& amb,
        const glm::vec3& diff,
        const glm::vec3& spec,
        float cons, float lin, float quad,
        float cut, float outerCut, float strength, float maxDistance, float bias)
        : type(lightType), direction(dir), ambient(amb), diffuse(diff), specular(spec),
        constant(cons), linear(lin), quadratic(quad), cutOff(cut), outerCutOff(outerCut), strength(strength), bias(bias),
        maxDistance(maxDistance){}

    ~LightComponent() {}
};



#endif
