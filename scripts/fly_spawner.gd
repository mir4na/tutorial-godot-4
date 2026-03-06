extends Node2D

@export var fly_scene: PackedScene
@export var spawn_interval: float = 1.0

func _ready():
	var timer = Timer.new()
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)

func _on_timer_timeout():
	if fly_scene:
		var fly = fly_scene.instantiate()
		fly.position = Vector2(1900, randf_range(-400, 400))
		add_child(fly)
