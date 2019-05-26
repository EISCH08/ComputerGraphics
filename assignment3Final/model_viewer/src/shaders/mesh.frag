// Fragment shader
#version 150
//Parker Eischen
in vec3 v_normal;
out vec4 frag_color;


in vec3 lightColor;
in vec3 world_normal;
in vec3 world_pos;

uniform vec3 u_lightColor;
uniform vec3 u_lightPos;
uniform float u_specularPower;
uniform vec3 u_ambientColor;
uniform vec3 u_specularColor;
uniform vec3 u_diffuseColor;
uniform int u_specularOn;
uniform int u_diffuseOn;
uniform int u_gammaOn;
uniform int u_ambientOn;
uniform int u_rgbSurfaceNormal;
uniform samplerCube u_cubemap;
uniform int u_levels;
uniform float u_edgeDetectionThreshold;
uniform float u_specMaskThreshold;
float scaleFactor = 1.0/u_levels;
uniform int u_celToggle;
uniform int u_noiseLines;
uniform int u_noiseCubes;
uniform float u_lineDensity;
uniform int u_cubeScaling;
uniform int u_noiseLava;

uniform float u_time;

float diffuse(vec3 L, vec3 N)
{
	return max(0.0, dot(L,N));
}

float specular(vec3 N, vec3 H, float specularPower)
{
	return pow(max(dot(N,H),0.0),specularPower);
} 


vec3 blinn_phong(vec3 N, vec3 L, vec3 H, vec3 V) 
{
	float normalization = (8.0 + u_specularPower) / 8.0;
	vec3 color = vec3(0,0,0);
	
	//ambient
	vec3 ia = (u_ambientColor * u_lightColor) * u_ambientOn;

	//diffuse
	float diff = diffuse(L,N);
	vec3 id = (u_diffuseColor * u_lightColor * diff) * u_diffuseOn;

	//specular
	float spec = specular(N,H,u_specularPower);
	vec3 is =  normalization*(u_specularColor * u_lightColor * spec)* u_specularOn;

	//float edgeDetection = (dot(V, world_normal) > u_edgeDetectionThreshold) ? 1 : 0;
	//float specMask = (pow(dot(H, world_normal), u_specularPower) > u_specMaskThreshold) ? 1 : 0;
	vec3 light = ia + id + is;
	color = light;
	


	
	return color;

	

}

vec3 gamma_correction(vec3 linear_color)
{
	return pow(linear_color, vec3(1.0/2.2));
}







void main()
{
	vec3 eyePosition = vec3(0.f,0.f,-5.0f);
    vec3 N = world_normal;
    vec3 L = normalize(u_lightPos.xyz - world_pos);
    vec3 V = normalize(eyePosition - world_pos);
    vec3 H = normalize(L+V);
	vec3 R = reflect(-V,N);
	vec3 color = texture(u_cubemap,R).rgb;
	color += blinn_phong(N,L,H,V);

	if(u_rgbSurfaceNormal == 1){
		color = N*0.5 + 0.5;
	}

	if(u_gammaOn == 1){
		color = gamma_correction(color);
	}
	
    frag_color = vec4(color, 1.0);

	
	
}
