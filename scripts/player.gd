extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

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

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
		if direction < 0:
			$Sprite2D.flip_h = true
		elif direction > 0:
			$Sprite2D.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if not is_on_floor():
		$Animator.play("Jump")
	elif direction != 0:
		$Animator.play("Walk")
	else:
		$Animator.play("Idle")

	move_and_slide()
