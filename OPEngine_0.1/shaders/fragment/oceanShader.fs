#version 330 core

layout(location = 0) out vec3 gPosition;
layout(location = 1) out vec3 gNormal;
layout(location = 2) out vec4 gAlbedo;

in vec3 FragPos;
in vec3 Normal;
in vec2 TexCoords;

uniform sampler2D texture_diffuse1; // Textura del agua o la isla
uniform sampler2D normalMap;       // Mapa de normales para las olas
uniform vec3 u_color;              // Color base
uniform float time;                // Tiempo para animar las olas

void main() {
    // Muestra la textura difusa
    vec4 texColor = texture(texture_diffuse1, TexCoords);

    // Aplicar el mapa de normales para simular las olas
    vec3 normal = normalize(Normal);
    vec3 tangentNormal = texture(normalMap, TexCoords + time * 0.02).rgb * 2.0 - 1.0;
    tangentNormal = normalize(tangentNormal);

    // Mezclar la normal original con la normal del mapa de normales
    normal = normalize(normal + tangentNormal * 0.5);

    // Escribir en el G-Buffer
    gPosition = FragPos;
    gNormal = normal * 0.5 + 0.5; // Mapear la normal de [-1, 1] a [0, 1]
    gAlbedo = texColor * vec4(u_color, 1.0);
}