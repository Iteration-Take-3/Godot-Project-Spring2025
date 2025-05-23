extends Node2D

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_0):
		get_tree().change_scene_to_file("res://scenes/stages/test.tscn");
	if Input.is_key_pressed(KEY_1):
		get_tree().change_scene_to_file("res://scenes/stages/CaseOh.tscn");
	if Input.is_key_pressed(KEY_2):
		get_tree().change_scene_to_file("res://scenes/stages/bob.tscn");
