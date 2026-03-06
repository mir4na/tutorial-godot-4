extends Node2D

@export var fish_scene: PackedScene
@export var spawn_interval: float = 1.0

func _ready():
	var timer = Timer.new()
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)

func _on_timer_timeout():
	if fish_scene:
		var fish = fish_scene.instantiate()
		fish.position = Vector2(randf_range(-100, 1000), 900)
		add_child(fish)
