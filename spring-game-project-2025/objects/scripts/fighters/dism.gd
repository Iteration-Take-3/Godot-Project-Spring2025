extends "res://objects/scripts/fighters/player.gd"

func _ready() -> void:
	$Label.text = "Stocks: " + str(stocks)
	speed = 400
	gravity = 800
	jump_height = 400
	gravity_cap = 1250
	friction = 1500

func attack():
	print("Dism attack!!!")
	$"Left Hand".add_to_group("hitbox")
	$"Left Hand".remove_from_group("hurtbox")
	$"Right Hand".add_to_group("hitbox")
	$"Right Hand".remove_from_group("hurtbox")
	dealing = 2;
	launching = Vector2(500,-130);
	atk_timer = 10;

func attack_handler():
	atk_timer -= 1;
	if atk_timer <= 0:
		reset();

func reset():
	print("Attack end")
	$"Left Hand".add_to_group("hurtbox")
	$"Left Hand".remove_from_group("hitbox")
	$"Right Hand".add_to_group("hurtbox")
	$"Right Hand".remove_from_group("hitbox")
	dealing = 0;
	launching = Vector2(0,0);
