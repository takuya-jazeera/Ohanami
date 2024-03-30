shader_type spatial;
uniform float val = 0.0;
uniform sampler2D tex : repeat_enable;
uniform sampler2D tex2 : repeat_enable;

void vertex() {
	float l = 10.0 *  length(VERTEX);
	VERTEX = VERTEX + 0.1 * vec3(sin(10.0 * VERTEX.y + val),0.0,-20.0 * exp(-0.2 * l));
	// Called for every vertex the material is visible on.
}

void fragment() {
	float r = texture(tex,UV*10.0-vec2(0.1)).x;
	float g = texture(tex,UV*10.0).y;
	float b = texture(tex,UV*10.0+vec2(0.1)).z;
	//float k = max(r, max(g,b));
	ALBEDO = vec3(r,g,b) * 0.1 + 0.4 * texture(tex2,UV * 2.0 + vec2(val* 0.05,val * 0.05)).xyz + vec3(0.0,0.1,0.0);
	// Called for every pixel the material is visible on.
}

void light() {
	DIFFUSE_LIGHT = vec3(1.0,1.0,1.0);
}