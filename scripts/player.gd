extends CharacterBody2D

const ACCELERATION = 400.0
const DECELERATION = 400.0
const JUMP_VELOCITY = -400.0
@export var speed: float = 300.0

func _ready() -> void:
	floor_snap_length = 10.0
	floor_constant_speed = true
	floor_max_angle = deg_to_rad(60)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		$Sprite2D.rotation = lerp_angle($Sprite2D.rotation, 0.0, delta * 10)
	else:
		var floor_normal = get_floor_normal()
		var target_angle = floor_normal.angle() + PI / 2
		$Sprite2D.rotation = lerp_angle($Sprite2D.rotation, target_angle, delta * 15)

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")
	if direction > 0:
		$Sprite2D.flip_h = false
		velocity.x = lerp(velocity.x, speed, ACCELERATION / speed)
	elif direction < 0:
		$Sprite2D.flip_h = true
		velocity.x = lerp(velocity.x, -speed, ACCELERATION / speed)
	else:
		velocity.x = lerp(velocity.x, 0.0, DECELERATION / speed)

	if not is_on_floor():
		$Animator.play("Jump")
	elif direction != 0:
		$Animator.play("Walk")
	else:
		$Animator.play("Idle")

	move_and_slide()
