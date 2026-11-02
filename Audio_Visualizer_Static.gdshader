shader_type canvas_item;
uniform float amount = 10.0;


uniform float X: hint_range(0.0, 80.0) = 72;
uniform float Y: hint_range(0.0, 80.0) = 11;

uniform float fade_amount : hint_range(0.0, 1.0) = 0.0;

void fragment() {
	vec2 uv = UV*0.05;//
	float a = fract(sin(dot(UV, vec2(11.239, 32.0079)*TIME)) * 238.5453)*1.0;
	
	vec4 col = texture(TEXTURE, UV);
	col.a *= pow(a, amount);
	COLOR.a = col.a;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
