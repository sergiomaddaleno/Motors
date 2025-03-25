#ifndef COMPONENTS_HPP
#define COMPONENTS_HPP

#include <glm/glm.hpp>

class ColorComponent {
public:
    ColorComponent() : value(1.0f, 1.0f, 1.0f, 1.0f), castShadow(true) {}
    ColorComponent(const glm::vec4& v, bool castShadow) : value(v), castShadow(castShadow) {}

    glm::vec4 value;
    bool castShadow;

    ~ColorComponent() {}
};

class VelocityComponent {
public:
    VelocityComponent() : value(0.0f) {}
    VelocityComponent(float v) : value(v) {}

    float value;

    ~VelocityComponent() {}
};

#endif 


