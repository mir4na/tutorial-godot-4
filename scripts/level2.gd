extends Node2D

var has_collectible = false

func _ready():
	Global.lose_scene = "res://scenes/Level2.tscn"

func _on_abyss_body_entered(body):
	if body.name == "Player":
		Global.lives -= 1
		if Global.lives == 0:
			get_tree().change_scene_to_file("res://scenes/LoseScreen.tscn")
			return
		var camera = body.get_node("Camera2D")
		var cam_pos = camera.global_position
		camera.top_level = true
		camera.global_position = cam_pos
		
		$HUD/Label.visible = false
		await get_tree().create_timer(2.0).timeout
		
		get_tree().change_scene_to_file("res://scenes/Level2.tscn")

func _on_collectible_body_entered(body):
	if body.name == "Player":
		has_collectible = true
		$Collectible.queue_free()

func _on_win_body_entered(body):
	if body.name == "Player":
		if has_collectible:
			Global.next_scene = "res://scenes/main_menu.tscn"
			get_node("/root/TransitionManager").transition_to("res://scenes/WinScreen.tscn")
		else:
			Global.lives -= 1
			if Global.lives == 0:
				get_tree().change_scene_to_file("res://scenes/LoseScreen.tscn")
			else:
				get_tree().change_scene_to_file("res://scenes/Level2.tscn")

func _on_activate_platform_body_entered(body):
	if body.name == "Player":
		$MovingPlatform.activate()
		$ActivatePlatform.queue_free()
