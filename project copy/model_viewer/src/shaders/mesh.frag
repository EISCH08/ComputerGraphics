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
	vec3 id = u_diffuseColor * u_diffuseOn;

	//specular
	float spec = specular(N,H,u_specularPower);
	vec3 is =  normalization*(spec * u_specularColor)* u_specularOn;

	float edgeDetection = (dot(V, world_normal) > u_edgeDetectionThreshold) ? 1 : 0;
	float specMask = (pow(dot(H, world_normal), u_specularPower) > u_specMaskThreshold) ? 1 : 0; 
	if(u_celToggle == 1){
		id = id * floor(diff*u_levels)*scaleFactor;
		vec3 light = edgeDetection * ( id + is * specMask);
		color = light;
	}
	else{
		color = ia+id+is;
	}
	


	
	return color;

	

}

vec3 gamma_correction(vec3 linear_color)
{
	return pow(linear_color, vec3(1.0/2.2));
}


float random (in vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))
                 * 43758.5453123);
}

float noise(vec2 st) {
    vec2 i = floor(st);
    vec2 f = fract(st);
    vec2 u = f*f*(3.0-2.0*f);
    return mix( mix( random( i + vec2(0.0,0.0) ),
                     random( i + vec2(1.0,0.0) ), u.x),
                mix( random( i + vec2(0.0,1.0) ),
                     random( i + vec2(1.0,1.0) ), u.x), u.y);
}

mat2 rotate2d(float angle){
    return mat2(cos(angle),-sin(angle),
                sin(angle),cos(angle));
}

float lines(in vec2 pos, float b){
    float scale = 10.0;
    pos *= scale;
    return smoothstep(0.0,
                    .5+b*.5,
                    abs((sin(pos.x*3.1415)+b*2.0))*.5);
}

vec3 mod289(vec3 x) { return x - floor(x * (1.0 / 289.0)) * 289.0; }
vec2 mod289(vec2 x) { return x - floor(x * (1.0 / 289.0)) * 289.0; }
vec3 permute(vec3 x) { return mod289(((x*34.0)+1.0)*x); }

float snoise(vec2 v) {
    const vec4 C = vec4(0.211324865405187,  // (3.0-sqrt(3.0))/6.0
                        0.366025403784439,  // 0.5*(sqrt(3.0)-1.0)
                        -0.577350269189626,  // -1.0 + 2.0 * C.x
                        0.024390243902439); // 1.0 / 41.0
    vec2 i  = floor(v + dot(v, C.yy) );
    vec2 x0 = v -   i + dot(i, C.xx);
    vec2 i1;
    i1 = (x0.x > x0.y) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    vec4 x12 = x0.xyxy + C.xxzz;
    x12.xy -= i1;
    i = mod289(i); // Avoid truncation effects in permutation
    vec3 p = permute( permute( i.y + vec3(0.0, i1.y, 1.0 ))
        + i.x + vec3(0.0, i1.x, 1.0 ));

    vec3 m = max(0.5 - vec3(dot(x0,x0), dot(x12.xy,x12.xy), dot(x12.zw,x12.zw)), 0.0);
    m = m*m ;
    m = m*m ;
    vec3 x = 2.0 * fract(p * C.www) - 1.0;
    vec3 h = abs(x) - 0.5;
    vec3 ox = floor(x + 0.5);
    vec3 a0 = x - ox;
    m *= 1.79284291400159 - 0.85373472095314 * ( a0*a0 + h*h );
    vec3 g;
    g.x  = a0.x  * x0.x  + h.x  * x0.y;
    g.yz = a0.yz * x12.xz + h.yz * x12.yw;
    return 130.0 * dot(m, g);
}










void main()
{
	vec3 eyePosition = vec3(0.f,0.f,-5.0f);
    vec3 N = world_normal;
    vec3 L = normalize(u_lightPos.xyz - world_pos);
    vec3 V = normalize(eyePosition - world_pos);
    vec3 H = normalize(L+V);
	vec3 R = reflect(-V,N);

	vec3 color = blinn_phong(N,L,H,V);

	if(u_rgbSurfaceNormal == 1){
		color = N*0.5 + 0.5;
	}

	if(u_gammaOn == 1){
		color = gamma_correction(color);
	}
	
	//noise
    vec2 st = gl_FragCoord.xy/vec2(500,500);
    st.y *= 1;
    vec2 pos = vec2(0);





    //line noise
    if (u_noiseLines == 1){
    	pos = st.yx*vec2(10.,3.);

	    float pattern = pos.x;

	    // Add noise
	    pos = rotate2d(noise(pos)) * pos;

	    // Draw lines
	    pattern = lines(pos,u_lineDensity);
	    frag_color = vec4(color*pattern, 1.0);

    }
    else if(u_noiseCubes == 1){
    	pos = vec2(st*u_cubeScaling);
    	float n = noise(pos);
    	frag_color = vec4(color*n, 1.0);
    }
    else if(u_noiseLava == 1){
    	pos = vec2(st*3.);
    	float DF = 0.0;
    	float a = 0.0;
	    vec2 vel = vec2(u_time*.1);
	    DF += snoise(pos+vel)*.25+.25;

	    // Add a random position
	    a = snoise(pos*vec2(cos(u_time*0.15),sin(u_time*0.1))*0.1)*3.1415;
	    vel = vec2(cos(a),sin(a));
	    DF += snoise(pos+vel)*.25+.25;
	    vec3 result = vec3(smoothstep(.7,.75,fract(DF)));
	    result = 1-result;
	    frag_color = vec4(color*result,1.0);
    }


    else{
    	frag_color = vec4(color, 1.0);
    }

	
	
}
