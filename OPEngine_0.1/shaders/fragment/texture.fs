#version 330 core
out vec4 FragColor;

in vec2 TexCoord;

uniform sampler2D texture1;
uniform vec4 u_color;

void main()
{
    FragColor = u_color * texture(texture1, TexCoord);
}