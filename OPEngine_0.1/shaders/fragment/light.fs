#version 330 core

in vec3 FragPos;
in vec3 Normal;
in vec2 TexCoords;

out vec4 FragColor;

// Uniforms for Directional Light
uniform vec3 dirLightDirection;
uniform vec3 dirLightAmbient;
uniform vec3 dirLightDiffuse;
uniform vec3 dirLightSpecular;

// Uniforms for Material and Camera
uniform sampler2D texture_diffuse;
uniform vec3 viewPos;

void main() {
    // Ambient
    vec3 ambient = dirLightAmbient * vec3(texture(texture_diffuse, TexCoords));

    // Diffuse
    vec3 norm = normalize(Normal);
    vec3 lightDir = normalize(-dirLightDirection);
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = dirLightDiffuse * diff * vec3(texture(texture_diffuse, TexCoords));

    // Specular
    vec3 viewDir = normalize(viewPos - FragPos);
    vec3 reflectDir = reflect(-lightDir, norm);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), 32.0);
    vec3 specular = dirLightSpecular * spec;

    // Final color
    vec3 result = ambient + diffuse + specular;
    FragColor = vec4(result, 1.0);
    //FragColor = vec4(1.0, 0.0, 0.0, 1.0);
}
