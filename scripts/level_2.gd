extends Button

@export var level2_scene: PackedScene
@onready var feedback = $"../../VBoxContainer/Feedback"

func _on_level2_pressed() -> void:
	if Global.level1_done:
		get_tree().change_scene_to_packed(level2_scene)
	else:
		feedback.text = "Selesaikan level 1 terlebih dahulu"
		print("selesaikan level 1 terlebih dahulu")
		
		await get_tree().create_timer(3.0).timeout
		
		feedback.text = " "
