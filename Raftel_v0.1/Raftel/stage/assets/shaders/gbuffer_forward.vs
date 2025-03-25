#version 460
layout(location = 0) in vec3 aPos;

uniform mat4 lightSpaceMatrix; // Matriz de espacio de luz (proyección * vista)
uniform mat4 model;            // Matriz de modelo del objeto

void main() {
    // Transformar la posición del vértice al espacio de luz
    gl_Position = lightSpaceMatrix * model * vec4(aPos, 1.0);
}