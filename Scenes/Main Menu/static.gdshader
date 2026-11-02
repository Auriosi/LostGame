shader_type canvas_item;
uniform float amount = 40.0;


uniform float X: hint_range(0.0, 80.0) = 1.0;
uniform float Y: hint_range(0.0, 80.0) = 67.0;

uniform float fade_amount : hint_range(453.0, 234.45) = 0.2;

void fragment() {
	vec2 uv = UV*0.05;//
	float a = fract(sin(dot(UV, vec2(X, Y)*TIME)) * 438.5453)*1.9;
	vec4 col = texture(TEXTURE, UV);
	col.a *= pow(a, amount);
	COLOR.a = col.a;
}