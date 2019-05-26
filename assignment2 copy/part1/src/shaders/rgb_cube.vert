// Vertex shader
#version 150
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in vec4 a_position;
out vec3 v_color;
uniform mat4 mvp;
void main()
{
    gl_Position = mvp * a_position;
    v_color = (a_position.xyz/2) +0.5;
}
