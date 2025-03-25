#version 460 core
in vec2 TexCoords;
in vec3 worldPos;
in vec3 viewRay;

out vec4 FragColor;

uniform sampler2D sceneDepthTex;    // Textura de profundidad de la escena
uniform sampler2D sceneColorTex;    // Textura de color de la escena
uniform sampler3D noiseVolume;      // Textura 3D de ruido para las nubes
uniform float time;                 // Tiempo para animación
uniform vec3 cloudColor;            // Color base de las nubes
uniform vec3 lightDir;              // Dirección de la luz
uniform float cloudDensity;         // Densidad de las nubes
uniform float cloudScale;           // Escala de las nubes
uniform float cloudSpeed;           // Velocidad de movimiento
uniform float cloudCoverage;        // Cobertura del cielo
uniform float cloudHeight;          // Altura base de las nubes
uniform float cloudThickness;       // Grosor de la capa de nubes

uniform float nearPlane;
uniform float farPlane;

const int MAX_STEPS = 64;

// Función para obtener la profundidad de la escena en coordenadas de mundo
float getSceneDepth() {
    float depth = texture(sceneDepthTex, TexCoords).r;
    float z = depth * 2.0 - 1.0;
    float near = nearPlane;
    float far = farPlane;
    return (2.0 * near * far) / (far + near - z * (far - near));
}

// Función para obtener la densidad de la nube en una posición dada
float sampleCloudDensity(vec3 pos) {
    vec3 offset = vec3(time * cloudSpeed * 0.1, time * cloudSpeed * 0.05, 0.0);
    float noise = texture(noiseVolume, pos * cloudScale * 0.001 + offset).r;

    float heightFactor = 1.0 - clamp((abs(pos.y - cloudHeight) / cloudThickness), 0.0, 1.0);
    heightFactor = smoothstep(0.0, 1.0, heightFactor);
    
    float density = smoothstep(1.0 - cloudCoverage, 1.0, noise) * heightFactor * cloudDensity;
    
    return density;
}

// Función simple para simular el scattering de la luz (Beer-Lambert)
vec3 calculateLightContribution(vec3 pos, float density) {
    // Dirección normalizada de la luz
    vec3 lightDirection = normalize(lightDir);
    
    // Distancia de muestreo para shadow rays
    float shadowDist = 64.0;
    vec3 shadowPos = pos + lightDirection * shadowDist;
    
    // Muestrear densidad en la dirección de la luz
    float shadowDensity = sampleCloudDensity(shadowPos);
    
    // Cálculo de atenuación basado en la ley de Beer-Lambert
    float transmittance = exp(-shadowDensity * 0.3);
    
    // Devolver contribución de luz atenuada
    return cloudColor * (0.6 + 0.4 * transmittance);
}

void main() {
    // Obtener el color de la escena original
    vec4 sceneColor = texture(sceneColorTex, TexCoords);
    
    // Obtener la profundidad de la escena
    float sceneDepthDistance = getSceneDepth();
    
    // Calcular la dirección del rayo normalizada
    vec3 ray = normalize(viewRay);
    
    // Punto de inicio del raymarching (posición de la cámara)
    vec3 rayOrigin = worldPos;
    
    // Calcular la intersección con el plano inferior de la capa de nubes
    float cloudBottom = cloudHeight - cloudThickness * 0.5;
    float t1 = (cloudBottom - rayOrigin.y) / ray.y;
    
    // Calcular la intersección con el plano superior de la capa de nubes
    float cloudTop = cloudHeight + cloudThickness * 0.5;
    float t2 = (cloudTop - rayOrigin.y) / ray.y;
    
    // Asegurarse de que t1 sea menor que t2
    if (t1 > t2) {
        float temp = t1;
        t1 = t2;
        t2 = temp;
    }
    
    // Limitar t2 a la profundidad de la escena
    t2 = min(t2, sceneDepthDistance);
    
    // Si el rayo no intersecta con la capa de nubes o está detrás de objetos, usar el color de la escena
    if (t1 > t2 || t2 < 0.0) {
        FragColor = sceneColor;
        return;
    }
    
    // Asegurarse de que t1 sea positivo (frente a la cámara)
    t1 = max(t1, 0.0);
    
    // Calcular el paso para el raymarching
    float stepSize = (t2 - t1) / float(MAX_STEPS);
    
    // Acumuladores para el color y la opacidad
    vec4 cloudColor = vec4(0.0);
    float transmittance = 1.0;
    
    // Raymarching a través del volumen de nubes
    for (int i = 0; i < MAX_STEPS; i++) {
        if (transmittance < 0.01) break; // Optimización: salir temprano si la opacidad es alta
        
        float t = t1 + stepSize * float(i);
        vec3 pos = rayOrigin + ray * t;
        
        // Obtener densidad de la nube en esta posición
        float density = sampleCloudDensity(pos);
        
        if (density > 0.0) {
            // Calcular contribución de luz
            vec3 lightContrib = calculateLightContribution(pos, density);
            
            // Calcular absorción usando la ley de Beer-Lambert
            float absorption = exp(-density * stepSize * 0.1);
            
            // Acumular color con ponderación por densidad
            vec3 cloudSample = lightContrib * density * stepSize * 0.1;
            
            // Fusionar usando blending "over" premultiplicado
            cloudColor.rgb += transmittance * cloudSample;
            
            // Actualizar transmitancia
            transmittance *= absorption;
        }
    }
    
    // Fusionar nubes con la escena original
    vec3 finalColor = sceneColor.rgb * transmittance + cloudColor.rgb;
    
    finalColor = mix(finalColor, cloudColor.rgb, 0.0);
    
    FragColor = vec4(finalColor, 1.0);
}