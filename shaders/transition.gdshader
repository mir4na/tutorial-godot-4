shader_type canvas_item;

uniform float progress : hint_range(0.0, 1.0) = 0.0;

void fragment() {
	float dist = distance(UV, vec2(0.5, 0.5));
	if (dist > progress * 1.5) {
		COLOR.a = 0.0;
	} else {
		COLOR.a = 1.0;
	}
}
