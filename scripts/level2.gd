extends Node2D

var has_collectible = false

func _on_abyss_body_entered(body):
	if body.name == "Player":
		var camera = body.get_node("Camera2D")
		var cam_pos = camera.global_position
		camera.top_level = true
		camera.global_position = cam_pos
		
		$HUD/Label.visible = false
		await get_tree().create_timer(2.0).timeout
		
		body.set_physics_process(false)
		body.hide()
		body.velocity = Vector2.ZERO
		
		body.global_position = $Spawn.global_position
		camera.top_level = false
		camera.position = Vector2.ZERO
		
		body.show()
		body.set_physics_process(true)
		$HUD/Label.visible = true

func _on_collectible_body_entered(body):
	if body.name == "Player":
		has_collectible = true
		$Collectible.queue_free()

func _on_win_body_entered(body):
	if body.name == "Player":
		if has_collectible:
			Global.next_scene = "res://scenes/MainMenu.tscn"
			get_tree().change_scene_to_file("res://scenes/WinScreen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/LoseScreen.tscn")
