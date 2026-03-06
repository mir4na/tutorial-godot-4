extends Area2D

@export var speed: float = 300.0

func _physics_process(delta):
	position.y -= speed * delta

func _on_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://scenes/LoseScreen.tscn")
