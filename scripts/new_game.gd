extends LinkButton

@export var scene_to_load: PackedScene

func _on_New_Game_pressed():
	Global.lives = 3
	get_tree().change_scene_to_packed(scene_to_load)
