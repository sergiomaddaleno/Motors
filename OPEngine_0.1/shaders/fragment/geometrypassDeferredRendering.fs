#version 330 core

layout(location = 0) out vec3 gPosition;
layout(location = 1) out vec3 gNormal;
layout(location = 2) out vec4 gAlbedo;

in vec3 FragPos;
in vec3 Normal;
in vec2 TexCoords;

uniform sampler2D texture_diffuse1;
uniform vec3 u_color;

void main() {

    vec4 texColor = texture(texture_diffuse1, TexCoords);
    
    if (texColor.a < 0.8) {
        discard;
    }

    gPosition = FragPos;
    gNormal = normalize(Normal) * 0.5 + 0.5;
    gAlbedo = texColor * vec4(u_color, 1.0);
}