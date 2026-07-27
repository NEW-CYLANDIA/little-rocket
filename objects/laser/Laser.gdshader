shader_type canvas_item;

// Controls how fast the texture scrolls
uniform float scroll_speed : hint_range(-10.0, 10.0) = 1.0;
varying vec4 vertex_color; 

void vertex() {
	vertex_color = COLOR;
}
void fragment() {
    // Offset the X coordinate of the UV over time to scroll along the line
    vec2 scrolled_uv = vec2(UV.x - (TIME * scroll_speed), UV.y);
    vec4 tex = texture(TEXTURE, scrolled_uv);
    // Sample the texture using the new scrolled coordinates
    COLOR = tex;
	COLOR.a = vertex_color.a * tex.a;
}