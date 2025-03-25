#version 330 core

struct Light {
    int type_light;  // 0: Point Light, 1: Directional Light, 2: Spot Light
    vec3 position;
    vec3 direction;
    vec3 ambient;
    vec3 diffuse;
    vec3 specular;
    float constant;
    float linear;
    float quadratic;
    float strength;
    float cutoff;
    float outerCutoff;
};

uniform Light light;
uniform vec3 viewPos;
uniform sampler2D texture_diffuse1;
uniform samplerCube shadowCubeMap; // Para luces puntuales
uniform sampler2D shadowMap;      // Para luces direccionales
uniform sampler2D spotShadowMap;  // Para luces focales
uniform float farPlane;
uniform float bias;

in vec3 FragPos;
in vec3 Normal;
in vec2 TexCoords;
in vec4 FragPosLightSpace;

out vec4 FragColor;

// Cálculo de sombras para luces direccionales y focales
float ShadowCalculation(vec4 fragPosLightSpace, sampler2D shadowMap) {
    vec3 projCoords = fragPosLightSpace.xyz / fragPosLightSpace.w;
    projCoords = projCoords * 0.5 + 0.5;
    
    // Comprobamos si estamos fuera del mapa de sombras
    if (projCoords.z > 1.0)
        return 0.0;
        
    float closestDepth = texture(shadowMap, projCoords.xy).r;
    float currentDepth = projCoords.z;
    
    // Aplicamos un bias dinámico basado en el ángulo entre la normal y la dirección de la luz
    float adjustedBias = max(0.05 * (1.0 - dot(Normal, normalize(-light.direction))), 0.005);
    
    // PCF (Percentage Closer Filtering)
    float shadow = 0.0;
    vec2 texelSize = 1.0 / textureSize(shadowMap, 0);
    for(int x = -1; x <= 1; ++x) {
        for(int y = -1; y <= 1; ++y) {
            float pcfDepth = texture(shadowMap, projCoords.xy + vec2(x, y) * texelSize).r; 
            shadow += currentDepth - adjustedBias > pcfDepth ? 1.0 : 0.0;        
        }    
    }
    shadow /= 9.0;
    
    return shadow;
}

float PointShadowCalculation(vec3 fragPos) {
    vec3 fragToLight = fragPos - light.position;
    
    float currentDepth = length(fragToLight);
    
    vec3 sampleDir = normalize(fragToLight);
    float closestDepth = texture(shadowCubeMap, sampleDir).r;
    

    closestDepth *= farPlane;
    float adjustedBias = 0.05;
    
    float shadow = currentDepth - adjustedBias > closestDepth ? 1.0 : 0.0;
    
    if(currentDepth >= farPlane - 0.5) {
        shadow = 0.0;
    }
    
    return shadow; 
}

// Cálculo de sombras para luces focales
// En forwardRendering.fs, ajusta la función SpotShadowCalculation
float SpotShadowCalculation(vec4 fragPosLightSpace) {
    vec3 projCoords = fragPosLightSpace.xyz / fragPosLightSpace.w;
    projCoords = projCoords * 0.5 + 0.5;
    
    // Verificar si estamos fuera del mapa de sombras
    if (projCoords.z > 1.0 || projCoords.x < 0.0 || projCoords.x > 1.0 || 
        projCoords.y < 0.0 || projCoords.y > 1.0)
        return 0.0;
        
    float closestDepth = texture(spotShadowMap, projCoords.xy).r;
    float currentDepth = projCoords.z;
    
    // Usar un bias fijo más pequeño para diagnóstico
    float fixedBias = 0.001;
    
    // PCF simplificado
    float shadow = 0.0;
    vec2 texelSize = 1.0 / textureSize(spotShadowMap, 0);
    for(int x = -1; x <= 1; ++x) {
        for(int y = -1; y <= 1; ++y) {
            float pcfDepth = texture(spotShadowMap, projCoords.xy + vec2(x, y) * texelSize).r; 
            shadow += currentDepth - fixedBias > pcfDepth ? 1.0 : 0.0;        
        }    
    }
    shadow /= 9.0;

    return shadow; 
}

void main() {
    vec3 norm = normalize(Normal);
    vec3 viewDir = normalize(viewPos - FragPos);
    vec3 lightDir;
    float attenuation = 1.0;
    float shadow = 0.0;
    
    if (light.type_light == 0) { // Point Light
        lightDir = normalize(light.position - FragPos);
        float distance = length(light.position - FragPos);
        attenuation = 1.0 / (light.constant + light.linear * distance + light.quadratic * (distance * distance));
        
        // Sombra para luz puntual
        //shadow = PointShadowCalculation(FragPos);
    } 
    else if (light.type_light == 1) { // Directional Light
        lightDir = normalize(-light.direction);
        attenuation = 1.0;
        
        // Sombra para luz direccional
        shadow = ShadowCalculation(FragPosLightSpace, shadowMap);
    } 
    else if (light.type_light == 2) { // Spot Light
        lightDir = normalize(light.position - FragPos);
        float theta = dot(lightDir, normalize(-light.direction));
        float epsilon = light.cutoff - light.outerCutoff;
        float intensity = clamp((theta - light.outerCutoff) / epsilon, 0.0, 1.0);
        float distance = length(light.position - FragPos);
        attenuation = (1.0 / (light.constant + light.linear * distance + light.quadratic * (distance * distance))) * intensity;
        
        // Sombra para luz focal
        shadow = SpotShadowCalculation(FragPosLightSpace);
    }
    
    // Cálculo de iluminación
    vec3 ambient = light.ambient * attenuation * light.strength;
    
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = light.diffuse * diff * attenuation * light.strength;
    
    vec3 reflectDir = reflect(-lightDir, norm);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), 32.0);
    vec3 specular = light.specular * spec * attenuation * light.strength;
    
    // Reducir la intensidad de la sombra para evitar oscuridad total
    float shadowFactor = min(shadow, 0.75);
    
    // Combinamos todas las componentes de luz, teniendo en cuenta las sombras
    // La luz ambiental no es afectada por las sombras
    vec3 lighting = ambient + (diffuse + specular) * (1.0 - shadowFactor);
    
    // Aplicamos la textura
    vec4 texColor = texture(texture_diffuse1, TexCoords);
    vec3 finalColor = lighting * texColor.rgb;
    
    FragColor = vec4(finalColor, texColor.a);
    
    // Para depuración - descomenta para visualizar el mapa de sombras
    // Si quieres ver el mapa de sombras para la luz focal:
    /*
    if (light.type_light == 2) {
        vec3 projCoords = FragPosLightSpace.xyz / FragPosLightSpace.w;
        projCoords = projCoords * 0.5 + 0.5;
        
        if (projCoords.x >= 0.0 && projCoords.x <= 1.0 && 
            projCoords.y >= 0.0 && projCoords.y <= 1.0) {
            float depth = texture(spotShadowMap, projCoords.xy).r;
            FragColor = vec4(vec3(depth), 1.0);
        }
    }
    */
}