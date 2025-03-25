#version 330 core

uniform vec3 lightPos;
uniform float farPlane;

in vec4 FragPos;

void main() {
    float lightDistance = length(FragPos.xyz - lightPos);
    
    // Normalizar la distancia al rango [0, 1]
    lightDistance = lightDistance / farPlane;
    
    // // Almacenar la distancia en el cubemap
    gl_FragDepth = lightDistance;
}