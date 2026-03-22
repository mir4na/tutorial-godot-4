extends TextureRect

func _ready():
	await get_tree().create_timer(3.0).timeout
	if Global.next_scene != "":
		get_node("/root/TransitionManager").transition_to(Global.next_scene)
	else:
		get_node("/root/TransitionManager").transition_to("res://scenes/main_menu.tscn")
