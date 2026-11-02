shader_type canvas_item;
uniform float amount = 10.0;


uniform float X: hint_range(0.0, 80.0) = 10;
uniform float Y: hint_range(0.0, 80.0) = 10;

uniform float fade_amount : hint_range(0.0, 1.0) = 0.0;

void fragment() {
	vec2 uv = UV*0.05;//
	float a = fract(sin(dot(UV, vec2(231.239, 12.789)*TIME)) * 438.5453)*1.1;
	
	vec4 col = texture(TEXTURE, UV);
	col.a *= pow(a, amount);
	COLOR.a = col.a;
}