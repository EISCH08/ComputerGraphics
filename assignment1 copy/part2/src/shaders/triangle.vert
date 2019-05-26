// Vertex shader
#version 150
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in vec4 a_position;
layout(location = 1) in vec3 a_color;
flat out vec3 v_color;

void main() {
    gl_Position = a_position;
    v_color = a_color;
    
}
