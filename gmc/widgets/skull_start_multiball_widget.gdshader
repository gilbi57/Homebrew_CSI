shader_type canvas_item;

// --- Uniform Parameters ---
uniform float pulse_strength : hint_range(0.0, 1) = 0.2; // How much to scale
uniform float progress : hint_range(0.0, 1) = 0.2; 

vec2 pulse_uv(vec2 uv, float scale) {
    // Center UVs and scale around the middle
    return (uv - 0.5) / scale + 0.5;
}

// --- Fragment Processor ---
void fragment() {
	float pulse = 0.0;
		
	pulse = progress * pulse_strength;
	
	
		
    // Scale UVs
    //float scale = 1.0 + pulse * pulse_strength;
	float scale = pulse * pulse_strength; 
	//1.0 + pulse * pulse_strength;
    vec2 uv_scaled = pulse_uv(UV, scale);
	
	// Sample
    vec4 tex_color = texture(TEXTURE, uv_scaled);

    COLOR = tex_color;
}