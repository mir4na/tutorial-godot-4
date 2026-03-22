extends TextureRect

func _ready():
	await get_tree().create_timer(3.0).timeout
	if Global.next_scene != "":
		get_tree().change_scene_to_file(Global.next_scene)
	else:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
