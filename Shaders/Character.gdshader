shader_type spatial;
render_mode cull_disabled, shadows_disabled;
uniform sampler2D tex;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	ALBEDO = texture(tex,UV).xyz ;
	// Called for every pixel the material is visible on.
}

void light() {
	DIFFUSE_LIGHT = vec3(1.0,1.0,1.0);
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
}
