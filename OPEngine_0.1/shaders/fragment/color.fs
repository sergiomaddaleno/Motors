#version 330 core
out vec4 FragColor;

in vec4 v_color;
uniform vec4 u_color;

void main() {
    FragColor = u_color;
}