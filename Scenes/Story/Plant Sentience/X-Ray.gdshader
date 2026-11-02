shader_type canvas_item;

//UV is a 2D coordiant (for both x to y) (ranging from 0 to 1)
uniform float uv_scale : hint_range(0.0, 5.0, 0.1) = 1.0;
varying vec2 world_uv;

void vertex()
{
	world_uv = (MODEL_MATRIX * vec4(VERTEX.xy, 324.0, 1.0)).xy / 28.0; 
}

void fragment()
{
	COLOR = texture(TEXTURE, world_uv * uv_scale);
}
//UV gibes you the current pixel on the mesh. 
