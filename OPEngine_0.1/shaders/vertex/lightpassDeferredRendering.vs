#version 330 core
layout(location = 0) in vec3 aPos;       // Posición del vértice
layout(location = 1) in vec2 aTexCoords; // Coordenadas de textura

out vec2 TexCoords; // Coordenadas de textura para el fragment shader

void main() {
    // Pasar las coordenadas de textura al fragment shader
    TexCoords = aTexCoords;

    // Transformar la posición del vértice a espacio de clip
    gl_Position = vec4(aPos, 1.0);
}