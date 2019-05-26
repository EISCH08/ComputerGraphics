// Fragment shader
#version 150

out vec4 frag_color;

uniform float u_time;

void main() {
    frag_color = vec4(sin(u_time*25),cos(u_time*25),sin(u_time*25),1.0);
}
