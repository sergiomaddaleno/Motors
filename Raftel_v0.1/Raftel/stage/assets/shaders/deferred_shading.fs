#version 460 core
out vec4 FragColor;

in vec2 TexCoords;

uniform sampler2D gPosition;
uniform sampler2D gNormal;
uniform sampler2D gAlbedoSpec;


uniform vec3 cam_pos;

uniform int has_ambient_light;
uniform vec3 ambient_color;

struct Light {
    int type;                // 0 = direccional, 1 = puntual, 2 = spot
    vec3 color;              // Color de la luz
    vec3 position;           // Posición (puntual/spot)
    vec3 direction;          // Dirección (direccional/spot)
    float intensity;         // Intensidad de la luz
    float range;             // Rango máximo de la luz puntual/spot
    float innerCone;         // Ángulo interno del spot
    float outerCone;         // Ángulo externo del spot
};

uniform Light lights;

//************** POINT LIGHTS **************//
vec3 CalculatePointLight(Light clight, vec3 fragPos, vec3 normal, vec3 albedo, float specular, vec3 viewDir){
    float distance_ = length(clight.position - fragPos);
    
    vec3 lightDir = normalize(clight.position - fragPos);
    vec3 diffuse = max(dot(normal, lightDir), 0.0) * albedo * clight.color;

    vec3 halfwayDir = normalize(lightDir + viewDir);
    float spec = pow(max(dot(normal, halfwayDir), 0.0), 32.0);
    vec3 newSpecular = clight.color * spec * specular;

    float attenuation = max(0.0f, 1.0f - (distance_ * distance_) / (clight.range * clight.range));

    diffuse *= attenuation;
    newSpecular *= attenuation;

    return (diffuse + newSpecular);
}

void main()
{             
    // retrieve data from gbuffer
    vec3 FragPos = texture(gPosition, TexCoords).rgb;
    vec3 Normal = texture(gNormal, TexCoords).rgb;
    vec3 Diffuse = texture(gAlbedoSpec, TexCoords).rgb;
    float Specular = texture(gAlbedoSpec, TexCoords).a;

    
    // then calculate lighting as usual
    vec3 finalColor  = vec3(0);
    vec3 viewDir  = normalize(cam_pos - FragPos);
    float constant = 1.0f;

    // Calcular luz
    if (lights.type == 0) { // Direccional
        //finalColor += CalculateDirectionalLight(norm, lights.color, lights.direction, view_dir);
    } else if (lights.type == 1) { // Puntual
        finalColor += CalculatePointLight(lights, FragPos, Normal, Diffuse, Specular, viewDir);
    } else if (lights.type == 2) { // Spot
        //finalColor += CalculateSpotLight(lights, norm, FragPos, view_dir);
    } 

    FragColor = vec4(finalColor, 1.0);
}