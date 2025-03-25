#version 330 core
out float FragColor;

in vec2 TexCoords;

uniform sampler2D gPosition;  // Posiciones en espacio mundial
uniform sampler2D gNormal;    // Normales en espacio mundial
uniform sampler2D texNoise;   // Textura de ruido

uniform mat4 view;            // Matriz de vista (para convertir a view space)
uniform mat4 projection;      // Matriz de proyección
uniform vec3 samples[64];     // Muestras de SSAO
uniform vec2 noiseScale;      // Escala de la textura de ruido
uniform float strength;       // Variable de fuerza para ajustar la intensidad de SSAO

// Parámetros
const float radius = 1.6;
const float bias = 0.125;

void main()
{
    // Obtener la posición y la normal en espacio mundial
    vec3 fragPosWorld = texture(gPosition, TexCoords).xyz;
    vec3 normalWorld = normalize(texture(gNormal, TexCoords).rgb);

    // Transformar la posición y la normal al espacio de vista
    vec3 fragPosView = (view * vec4(fragPosWorld, 1.0)).xyz;
    vec3 normalView = normalize(mat3(view) * normalWorld);

    // Obtener un vector de ruido aleatorio para rotar las muestras
    vec3 randomVec = normalize(texture(texNoise, TexCoords * noiseScale).xyz * 2.0 - 1.0);

    // Crear una matriz de cambio de base (TBN) para rotar las muestras
    vec3 tangent = normalize(randomVec - normalView * dot(randomVec, normalView));
    vec3 bitangent = cross(normalView, tangent);
    mat3 TBN = mat3(tangent, bitangent, normalView);

    // Calcular la oclusión
    float occlusion = 0.0;
    for (int i = 0; i < 64; ++i)
    {
        // Obtener la muestra en espacio tangente
        vec3 samplePos = TBN * samples[i]; // Rotar la muestra
        samplePos = fragPosView + samplePos * radius; // Escalar y desplazar la muestra

        // Convertir la muestra a espacio de pantalla
        vec4 offset = vec4(samplePos, 1.0);
        offset = projection * offset; // Proyectar la muestra
        offset.xyz /= offset.w; // Perspectiva divide
        offset.xyz = offset.xyz * 0.5 + 0.5; // Transformar a rango [0, 1]

        // Obtener la posición de la muestra en espacio mundial
        vec3 samplePosWorld = texture(gPosition, offset.xy).xyz;

        // Transformar la posición de la muestra al espacio de vista
        float sampleDepthView = (view * vec4(samplePosWorld, 1.0)).z;

        // Comparar la profundidad de la muestra con la profundidad real
        float rangeCheck = smoothstep(0.0, 1.0, radius / abs(fragPosView.z - sampleDepthView));
        occlusion += (sampleDepthView >= samplePos.z + bias ? 1.0 : 0.0) * rangeCheck;
    }

    // Promediar la oclusión y ajustar la intensidad
    occlusion = 1.0 - (occlusion / 64.0);
    FragColor = pow(occlusion, strength); // Aplicar la fuerza de SSAO
}