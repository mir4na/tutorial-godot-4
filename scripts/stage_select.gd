extends LinkButton


@export var scene_to_load: PackedScene

func _on_stage_select_pressed() -> void:
	Global.lives = 3
	get_tree().change_scene_to_packed(scene_to_load)
