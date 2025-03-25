#version 330 core
out vec4 FragColor;
in vec2 TexCoords;

uniform sampler2D gPosition;
uniform sampler2D gNormal;
uniform sampler2D gAlbedo;
uniform samplerCube shadowCubeMap;
uniform sampler2D ssao;

uniform vec3 viewPos;
uniform int textureType;
uniform float farPlane;

uniform float bias;

uniform float samples;
uniform float offset;
uniform float shadowStrength;

float ShadowCalculation(vec3 fragPosWorldSpace, vec3 lightPos) {
    vec3 fragToLight = fragPosWorldSpace - lightPos;
    float currentDepth = length(fragToLight);
    float shadow  = 0.0;
    for(float x = -offset; x < offset; x += offset / (samples * 0.6))
    {
        for(float y = -offset; y < offset; y += offset / (samples * 0.6))
        {
            for(float z = -offset; z < offset; z += offset / (samples * 0.6))
            {
                float closestDepth = texture(shadowCubeMap, fragToLight + vec3(x, y, z)).r; 
                closestDepth *= farPlane;   // undo mapping [0;1]
                if(currentDepth - bias > closestDepth)
                shadow += 1.0;
            }
        }
    }
    shadow /= (samples * samples * samples);

    return shadow;
}
struct Light {
    int type_light;
    vec3 position;    // Para luces point y spot
    vec3 direction;   // Para luces direccionales y spot
    vec3 ambient;
    vec3 diffuse;
    vec3 specular;
    float constant;    // Para luces point y spot
    float linear;      // Para luces point y spot
    float quadratic;   // Para luces point y spot
    float cutOff;      // Para luces spot
    float outerCutOff; // Para luces spot
    float strength;    // Nueva variable: fuerza de la luz
    float maxDistance; // Nueva variable
};

#define MAX_LIGHTS 10
uniform Light lights[MAX_LIGHTS];
uniform int numLights;

void main() {
    if (textureType == 0) {
        // Position
        vec3 FragPos = texture(gPosition, TexCoords).rgb;
        FragColor = vec4(FragPos, 1.0);
    } else if (textureType == 1) {
        // Normals
        vec3 Normal = texture(gNormal, TexCoords).rgb * 2.0 - 1.0;
        FragColor = vec4(Normal, 1.0);
    } else if (textureType == 2) {
        // Albedo
        vec3 Albedo = texture(gAlbedo, TexCoords).rgb;
        FragColor = vec4(Albedo, 1.0);

    } else if (textureType == 3) {  
        float ao = texture(ssao, TexCoords).r;
        FragColor = vec4(vec3(ao), 1.0);

    } else if (textureType == 4) {
        // Lighting
        vec3 FragPos = texture(gPosition, TexCoords).rgb;
        vec3 Normal = texture(gNormal, TexCoords).rgb * 2.0 - 1.0;
        vec3 Albedo = texture(gAlbedo, TexCoords).rgb;

        const float gamma = 2.0;
        Albedo = pow(Albedo, vec3(1.0 / gamma));
        
        float ao = texture(ssao, TexCoords).r;
        
        vec3 lighting;
        vec3 ambient = vec3(0.2 * Albedo * ao);
        vec3 viewDir  = normalize(viewPos - FragPos);
        vec3 totalDiffuse = vec3(0.0);
        vec3 totalSpecular = vec3(0.0);

        for (int i = 0; i < numLights; i++) {
            Light light = lights[i];
            
            vec3 lightDir;
            float attenuation = 1.0;
            float shadow = 0.0;

            float diff = 0.0;
            vec3 diffuse = vec3(0.0);

            vec3 halfwayDir= vec3(0.0);
            float spec = 0.0;
            vec3 specular = vec3(0.0);

            if (light.type_light == 0) { // Point light
                lightDir = normalize(light.position - FragPos);
                float distance = length(light.position - FragPos);
                if (distance > light.maxDistance) {
                    attenuation = 0.0;
                } else {
                    attenuation = 1.0 / (light.constant + light.linear * distance + light.quadratic * (distance * distance));
                }
                shadow = ShadowCalculation(FragPos, light.position);
                shadow *= shadowStrength;

                diff = max(dot(Normal, lightDir), 0.0);
                diffuse = diff * Albedo * light.diffuse * (light.strength * 200);

                // Specular (Blinn-Phong)
                halfwayDir = normalize(lightDir + viewDir);  
                spec = pow(max(dot(Normal, halfwayDir), 0.0), 32.0);
                specular = light.specular * spec * light.strength;
            
            } else if (light.type_light == 1) { // Directional light

                lightDir = normalize(-light.direction);
                diff = max(dot(Normal, lightDir), 0.0);
                diffuse = diff * Albedo * light.diffuse * light.strength;

                // Specular (Blinn-Phong)
                halfwayDir = normalize(lightDir + viewDir);  
                spec = pow(max(dot(Normal, halfwayDir), 0.0), 32.0);
                specular = light.specular * spec * light.strength;
                
            } else if (light.type_light == 2) { // Spot light
                lightDir = normalize(light.position - FragPos);
                float distance = length(light.position - FragPos);
                attenuation = 1.0 / (light.constant + light.linear * distance + light.quadratic * (distance * distance));

                float theta = dot(lightDir, normalize(-light.direction));
                float epsilon = light.cutOff - light.outerCutOff;
                float intensity = (theta - light.outerCutOff) / epsilon;
                intensity = clamp(intensity, 0.0, 1.0);
                attenuation *= intensity;

                diff = max(dot(Normal, lightDir), 0.0);
                diffuse = diff * Albedo * light.diffuse * (light.strength * 200);

                // Specular (Blinn-Phong)
                halfwayDir = normalize(lightDir + viewDir);  
                spec = pow(max(dot(Normal, halfwayDir), 0.0), 32.0);
                specular = light.specular * spec * light.strength;
            }

            // Aplicar sombras y atenuación
            diffuse *= attenuation * (1.0 - shadow);
            specular *= attenuation * (1.0 - shadow);
            
            totalDiffuse += diffuse;
            totalSpecular += specular;
        }
        
        lighting = (ambient + totalDiffuse + totalSpecular);
        FragColor = vec4(lighting, 1.0);
    }
}