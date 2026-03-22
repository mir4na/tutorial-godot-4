extends Area2D

@export var speed: float = 200.0

func _physics_process(delta):
	position.x -= speed * delta
	position.y += speed * 0.5 * delta

func _on_body_entered(body):
	if body.name == "Player":
		Global.lives -= 1
		if Global.lives == 0:
			get_tree().change_scene_to_file("res://scenes/LoseScreen.tscn")
			return
		get_tree().change_scene_to_file(Global.lose_scene)
