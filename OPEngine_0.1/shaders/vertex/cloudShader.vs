#version 460 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec2 aTexCoords;

out vec2 TexCoords;
out vec3 worldPos;
out vec3 viewRay;

uniform mat4 view;
uniform mat4 projection;
uniform vec3 cameraPos;

void main() {
    TexCoords = aTexCoords;
    gl_Position = vec4(aPos, 1.0);

    vec4 clip = vec4(aPos.x, aPos.y, 1.0, 1.0);
    
    mat4 invProj = inverse(projection);
    vec4 viewRayClip = invProj * clip;
    viewRayClip = vec4(viewRayClip.xy, -1.0, 0.0);
    
    mat4 invView = inverse(view);
    viewRay = normalize((invView * viewRayClip).xyz);

    worldPos = cameraPos;
}