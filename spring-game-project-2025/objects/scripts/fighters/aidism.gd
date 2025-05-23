extends "res://objects/scripts/fighters/dism.gd"

func _physics_process(delta: float) -> void:
	if stocks < 1:
		get_tree().change_scene_to_file("res://scenes/debug_stages.tscn");
	
	if atk_timer > 0:
		attack_handler();
	
	if (velocity.y < gravity_cap):
		velocity.y += gravity * delta
		
	move_and_slide()
