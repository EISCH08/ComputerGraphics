//Vertex shader
//Parker Eischen
#version 150
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in vec4 a_position;
layout(location = 1) in vec3 a_normal;

out vec3 v_normal;
out vec3 lightColor;
out vec3 world_normal;
out vec3 world_pos;
uniform mat4 u_mvp;
uniform mat4 u_mv;
uniform vec3 u_lightPos;
uniform vec3 u_pos_light_col;
uniform vec3 u_lightColor;
uniform mat4 u_m;
uniform float u_specularPower;


void main()
{
    v_normal = a_normal;
    gl_Position = u_mvp * a_position;
    world_pos = mat3(u_m) * a_position.xyz;
    world_normal = normalize(mat3(u_m)*a_normal.xyz);
}
