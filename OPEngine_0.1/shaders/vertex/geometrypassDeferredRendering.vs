#version 330 core
layout (location = 0) in vec3 aPos;  // Posición del vértice
layout (location = 1) in vec3 aNormal; // Color del vértice
layout (location = 2) in vec2 aTexCoords; // Coordenadas de textura del vértice

out vec3 FragPos;        // Posición del fragmento en espacio mundial
out vec3 Normal;         // Normal del fragmento en espacio mundial
out vec2 TexCoords;      // Coordenadas de textura

uniform mat4 model;       // Matriz de modelo
uniform mat4 view;        // Matriz de vista (cámara)
uniform mat4 projection;  // Matriz de proyección (perspectiva u ortográfica)

void main()
{
    vec4 worldPos = model * vec4(aPos, 1.0);
    FragPos = worldPos.xyz;

    TexCoords = aTexCoords; 

    mat3 normalMatrix = mat3(transpose(inverse(model)));
    Normal = normalMatrix * aNormal;

    gl_Position = projection * view * worldPos;
}