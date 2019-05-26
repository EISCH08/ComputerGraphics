// Vertex shader
#version 150
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in vec4 a_position;
uniform float u_time;

void main() {
    //gl_Position = vec4(a_position.x*sin(u_time),a_position.y*sin(u_time),a_position.z*sin(u_time),1);
    gl_Position = vec4(a_position.x+cos(u_time),a_position.y+sin(u_time),a_position.z+sin(u_time),1);
}
