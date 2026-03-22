extends Node2D

#func _ready():
	#await get_tree().create_timer(3.0).timeout
	#get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_restart_pressed() -> void:
	Global.lives = 3
	get_tree().change_scene_to_file(Global.lose_scene)


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
