extends StaticBody2D

@export var speed: float = 150.0
@export var distance: float = 600.0

var active: bool = false
var start_y: float = 0.0
var target_y: float = 0.0
var moving_up: bool = true

func _ready():
	start_y = position.y
	target_y = start_y - distance

func _physics_process(delta):
	if not active:
		return
	
	if moving_up:
		position.y -= speed * delta
		if position.y <= target_y:
			position.y = target_y
			moving_up = false
	else:
		position.y += speed * delta
		if position.y >= start_y:
			position.y = start_y
			moving_up = true

func activate():
	active = true
