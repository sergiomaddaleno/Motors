#version 330 core

layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

out vec3 FragPos;
out vec3 Normal;
out vec2 TexCoords;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform float time;

uniform sampler2D islandMask;

void main() {
    vec3 pos = aPos;

    // Olas principales
    float waveHeight = 0.1; // Altura máxima de las olas principales
    float waveFrequency = 2.0; // Frecuencia de las olas principales
    float waveSpeed = 2.0; // Velocidad de las olas principales

    float mainWave = waveHeight * sin(waveFrequency * pos.x + time * waveSpeed) * cos(waveFrequency * pos.z + time * waveSpeed);

    // Mini olas (ondas de menor amplitud y mayor frecuencia)
    float miniWaveHeight = 0.3; // Altura máxima de las mini olas
    float miniWaveFrequency = 8.0; // Frecuencia de las mini olas (más alta)
    float miniWaveSpeed = 2.0; // Velocidad de las mini olas (más rápida)

    float miniWave1 = miniWaveHeight * sin(miniWaveFrequency * pos.x + time * miniWaveSpeed) * cos(miniWaveFrequency * pos.z + time * miniWaveSpeed);
    float miniWave2 = miniWaveHeight * sin(miniWaveFrequency * pos.z + time * miniWaveSpeed) * cos(miniWaveFrequency * pos.x + time * miniWaveSpeed);

    // Combinar las olas principales y las mini olas
    float combinedWave = mainWave + miniWave1 + miniWave2;

    // Muestra la textura de la isla para limitar las olas
    float islandFactor = texture(islandMask, aTexCoords).r; // Suponiendo que la textura de la isla es en escala de grises

    // Aplicar las olas solo si no estamos en la isla
    pos.y += combinedWave * (1.0 - islandFactor);

    // Transformar la posición al espacio de la cámara y proyectarla
    FragPos = vec3(model * vec4(pos, 1.0));
    Normal = mat3(transpose(inverse(model))) * aNormal;
    TexCoords = aTexCoords;

    gl_Position = projection * view * model * vec4(pos, 1.0);
}