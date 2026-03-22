extends Button

@export var level1_scene: PackedScene

func _on_level1_pressed() -> void:
	get_tree().change_scene_to_packed(level1_scene)
