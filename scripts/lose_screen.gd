extends Node2D

func _ready():
	await get_tree().create_timer(3.0).timeout
	if Global.lose_scene != "":
		get_tree().change_scene_to_file(Global.lose_scene)
	else:
		get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
