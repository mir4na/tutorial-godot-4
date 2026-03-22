extends CanvasLayer

var color_rect: ColorRect
var tween: Tween
var target_scene: String = ""

func _ready():
	layer = 100
	color_rect = ColorRect.new()
	color_rect.set_anchors_preset(Control.PRESET_FULL_RECT)
	color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	color_rect.color = Color(0, 0, 0, 1)
	
	var shader = load("res://shaders/transition.gdshader")
	var mat = ShaderMaterial.new()
	mat.shader = shader
	mat.set_shader_parameter("progress", 0.0)
	color_rect.material = mat
	add_child(color_rect)

func transition_to(scene_path: String):
	target_scene = scene_path
	if tween and tween.is_running():
		tween.kill()
	tween = create_tween()
	tween.tween_method(set_progress, 0.0, 1.0, 0.5)
	tween.tween_callback(do_change_scene)
	tween.tween_method(set_progress, 1.0, 0.0, 0.5)

func set_progress(val: float):
	if color_rect and color_rect.material:
		color_rect.material.set_shader_parameter("progress", val)

func do_change_scene():
	if target_scene != "":
		get_tree().change_scene_to_file(target_scene)
