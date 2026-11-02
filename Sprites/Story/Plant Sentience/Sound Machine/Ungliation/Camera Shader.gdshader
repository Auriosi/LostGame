shader_type canvas_item;
uniform float amount = 10.0;


uniform float X: hint_range(0.0, 80.0) = 0.001;
uniform float Y: hint_range(0.0, 80.0) = 0.001;

uniform float fade_amount : hint_range(0.0, 1.0) = 0;

uniform float brightness = 1.9;

void fragment() {
	vec2 uv = UV*0.05;//
	float a = fract(sin(dot(UV, vec2(.001, 4.431)*TIME)) * 1238.5453)*brightness;
	
	vec4 col = texture(TEXTURE, UV);
	col.a *= pow(a, amount);
	COLOR.a = col.a;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
