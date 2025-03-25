#version 460 core
out vec4 FragColor;

in vec3 FragPos;
in vec3 Normal;
in vec2 TexCoord;

// Texturas
layout(location = 0) uniform sampler2D albedoTexture;
uniform int has_alb_text;

layout(location = 1) uniform sampler2D normalTexture;
uniform int has_norm_text;

layout(location = 2) uniform sampler2D roughnessTexture;
uniform int has_rough_text;

layout(location = 3) uniform sampler2D metallicTexture;
uniform int has_met_text;


// Valores uniformes
uniform vec3 u_color;            // Color base del material
uniform float u_shininess;       // Tamaño del brillo especular
uniform float u_roughnessValue;  // Rugosidad del material
uniform float u_metallicValue;   // Metalicidad del material
uniform float u_fresnel;         // Factor de Fresnel
uniform float u_ssFactor;        // Factor de dispersion de la luz

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

// === Función para calcular el color base (Albedo) ===
vec3 GetAlbedo() {
    return has_alb_text == 1 ? texture(albedoTexture, TexCoord).rgb : u_color;
}

// === Función para calcular rugosidad ===
float GetRoughness() {
    return has_rough_text == 1 ? texture(roughnessTexture, TexCoord).r : u_roughnessValue;
}

// === Función para calcular metalicidad ===
float GetMetallic() {
    return has_met_text == 1 ? texture(metallicTexture, TexCoord).r : u_metallicValue;
}

// === Función para calcular Fresnel ===
float CalculateFresnel(vec3 viewDir, vec3 normal) {
    return pow(1.0 - max(dot(viewDir, normal), 0.0), u_fresnel);
}

// === Función para calcular el mapa de normales ===
vec3 CalculateNormalMap(vec3 normal, vec3 tangent, vec3 bitangent, vec2 texCoords) {
    if (has_norm_text == 0) {
        return normal; // Si no hay textura de normales, usar la normal geométrica
    }

    // Obtener el valor del mapa de normales
    vec3 normalMap = texture(normalTexture, texCoords).rgb;
    normalMap = normalize(normalMap * 2.0 - 1.0); // Convertir de [0, 1] a [-1, 1]

    // Crear la matriz TBN (Tangent, Bitangent, Normal)
    mat3 TBN = mat3(tangent, bitangent, normal);
    return normalize(TBN * normalMap); // Transformar la normal al espacio del mundo
}

// === Iluminacion microfacetada GGX BRDF ===

float DistributionGGX(vec3 N, vec3 H, float roughness) {
    float a = roughness * roughness;  // Rugosidad al cuadrado
    float a2 = a * a;                 // Precalculo para eficiencia
    float NdotH = max(dot(N, H), 0.0); // Producto escalar entre la normal y el half-vector
    float NdotH2 = NdotH * NdotH;

    float num = a2;
    float denom = (NdotH2 * (a2 - 1.0) + 1.0); // Ajuste GGX
    denom = 3.14159265359 * denom * denom;     // Normalización

    return num / denom; // Valor de distribución
}

float GeometrySchlickGGX(float NdotV, float roughness) {
    float k = (roughness + 1.0);
    k = (k * k) / 8.0; // Ajuste GGX simplificado

    float denom = NdotV * (1.0 - k) + k;
    return NdotV / denom;
}

vec3 FresnelSchlick(float cosTheta, vec3 F0) {
    return F0 + (1.0 - F0) * pow(1.0 - cosTheta, 5.0);
}

vec3 CalculateSpecularGGX(vec3 N, vec3 V, vec3 L, vec3 F0, float roughness) {
    vec3 H = normalize(V + L); // Half-vector

    float NdotL = max(dot(N, L), 0.0);
    float NdotV = max(dot(N, V), 0.0);
    float NdotH = max(dot(N, H), 0.0);
    float HdotV = max(dot(H, V), 0.0);

    // Componentes del modelo GGX
    float D = DistributionGGX(N, H, roughness);
    float G = GeometrySchlickGGX(NdotV, roughness) * GeometrySchlickGGX(NdotL, roughness);
    vec3 F = FresnelSchlick(HdotV, F0);

    // Fórmula GGX
    return (D * G * F) / (4.0 * NdotV * NdotL + 0.001); // Evitar divisiones por cero
}


// === Función para calcular reflejo especular ===
vec3 CalculateSpecular(vec3 lightDir, vec3 viewDir, vec3 normal, vec3 lightColor) {
    vec3 reflectDir = reflect(-lightDir, normal);

    // Componente especular usando el modelo de Phong
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), u_shininess);

    // Reducir la intensidad del brillo especular según la rugosidad
    float roughness = GetRoughness();
    spec *= (1.0 - roughness);

    return spec * lightColor;
}

// === Función para aplicar metalicidad ===
vec3 ApplyMetallic(vec3 diffuseColor, vec3 specularColor) {
    float metallic = GetMetallic();
    return mix(diffuseColor, specularColor, metallic);
}

// === Luz ambiental ===
vec3 CalculateAmbientLight(vec3 normal, vec3 viewDir) {
    // Componente difusa de la luz ambiental
    vec3 albedo = GetAlbedo();
    vec3 ambientDiffuse = ambient_color * albedo;

    // Componente especular Fresnel en la luz ambiental
    vec3 F0 = mix(vec3(0.04), albedo, GetMetallic()); // Mezcla de dieléctrico y metálico
    float NdotV = max(dot(normal, viewDir), 0.0);
    vec3 ambientSpecular = FresnelSchlick(NdotV, F0) * ambient_color;

    // Mezcla de componentes difusa y especular
    return ambientDiffuse + ambientSpecular;
}

// === Luz spot ===
vec3 CalculateSpotLight(Light light_, vec3 normal_, vec3 fragpos_, vec3 viewdir_) {
    vec3 light_dir = normalize(light_.position - fragpos_);

    // Iluminación difusa
    vec3 albedo = GetAlbedo();
    float diff = max(dot(normal_, light_dir), 0.0);
    vec3 diffuse = diff * albedo;

    // Atenuación
    float distance = length(light_.position - fragpos_);
    float att = clamp(1.0 - (distance / light_.range), 0.0, 1.0);

    // Intensidad del spot
    float theta = dot(light_dir, normalize(-light_.direction));
    float epsilon = light_.innerCone - light_.outerCone;
    float intensity = clamp((theta - light_.outerCone) / epsilon, 0.0, light_.intensity);

    // Especular GGX
    vec3 F0 = mix(vec3(0.04), albedo, GetMetallic()); // Mezcla entre dieléctrico y metálico
    vec3 specular = CalculateSpecularGGX(normal_, viewdir_, light_dir, F0, GetRoughness());

    // Fresnel
    float fresnelFactor = CalculateFresnel(viewdir_, normal_);
    specular *= fresnelFactor;

    // Mezclar difuso y especular según el material
    vec3 finalColor = ApplyMetallic(diffuse, specular);

    return finalColor * att * intensity * light_.color;
}

// === Luz puntual ===
vec3 CalculatePointLight(Light light_, vec3 normal_, vec3 fragpos_, vec3 viewdir_) {
    vec3 light_dir = normalize(light_.position - fragpos_);

    // Iluminación difusa
    vec3 albedo = GetAlbedo();
    float diff = max(dot(normal_, light_dir), 0.0);
    vec3 diffuse = diff * albedo;

    // Atenuación
    float distance = length(light_.position - fragpos_);
    float att = clamp(1.0 - (distance / light_.range), 0.0, 1.0);

    // Especular GGX
    vec3 F0 = mix(vec3(0.04), albedo, GetMetallic()); // Mezcla entre dieléctrico y metálico
    vec3 specular = CalculateSpecularGGX(normal_, viewdir_, light_dir, F0, GetRoughness());

    // Fresnel
    float fresnelFactor = CalculateFresnel(viewdir_, normal_);
    specular *= fresnelFactor;

    // Mezclar difuso y especular según el material
    vec3 finalColor = ApplyMetallic(diffuse, specular);

    return finalColor * att * light_.color * light_.intensity;
}

// === Luz direccional ===
vec3 CalculateDirectionalLight(vec3 normal_, vec3 light_color_, vec3 light_dir_, vec3 viewdir_) {
    vec3 albedo = GetAlbedo();
    // Iluminación difusa
    float diff = max(dot(normal_, light_dir_), 0.0);
    vec3 diffuse = diff * albedo;

    // Especular GGX
    vec3 F0 = mix(vec3(0.04), albedo, GetMetallic()); // Mezcla entre dieléctrico y metálico
    vec3 specular = CalculateSpecularGGX(normal_, viewdir_, light_dir_, F0, GetRoughness());

    // Fresnel
    float fresnelFactor = CalculateFresnel(viewdir_, normal_);
    specular *= fresnelFactor;

    // Mezclar difuso y especular según el material
    vec3 finalColor = ApplyMetallic(diffuse, specular);

    return finalColor * light_color_;
}

// === Materiales translucidos ==
vec3 SubsurfaceScattering(vec3 lightColor, vec3 lightDir, vec3 viewDir, vec3 normal) {
    // Producto escalar entre la normal y la dirección de la luz
    float NdotL = max(dot(normal, lightDir), 0.0);

    // Factor de dispersión: cuanto más disperso, menos dependemos de la dirección
    float scattering = pow(NdotL, 1.0 - u_ssFactor); // Controlar la dirección del scattering

    // Luz dispersada
    vec3 scatteredLight = lightColor * scattering * u_ssFactor;

    return scatteredLight;
}

// === Ajuste de rango dinamico de color ===
vec3 TonemapACES(vec3 color) {
    float a = 2.51;
    float b = 0.03;
    float c = 2.43;
    float d = 0.59;
    float e = 0.14;
    return clamp((color * (a * color + b)) / (color * (c * color + d) + e), 0.0, 1.0);
}

// === Función principal ===
void main() {
    vec3 norm = normalize(Normal);

    // Calcular normales (con mapa de normales si está disponible)
    if (has_norm_text == 1) {
        vec3 tangent = vec3(1.0, 0.0, 0.0);   // Placeholder (debe venir del vertex shader)
        vec3 bitangent = vec3(0.0, 1.0, 0.0); // Placeholder (debe venir del vertex shader)
        norm = CalculateNormalMap(norm, tangent, bitangent, TexCoord);
    }

    vec3 view_dir = normalize(cam_pos - FragPos);
    vec3 finalColor = vec3(0.0);

    // Luz ambiental
    if (has_ambient_light != 0) {
        finalColor += CalculateAmbientLight(norm, view_dir);
    }

    // Calcular luz
    if (lights.type == 0) { // Direccional
        finalColor += CalculateDirectionalLight(norm, lights.color, lights.direction, view_dir);
    } else if (lights.type == 1) { // Puntual
        finalColor += CalculatePointLight(lights, norm, FragPos, view_dir);
    } else if (lights.type == 2) { // Spot
        finalColor += CalculateSpotLight(lights, norm, FragPos, view_dir);
    }
    
    finalColor = TonemapACES(finalColor);
    finalColor += SubsurfaceScattering(lights.color, normalize(lights.position - FragPos), view_dir, norm);
    FragColor = vec4(finalColor, 1.0);
}
