extends CharacterBody2D

var speed = 100
var gravity = 750
var jump_height = 500
var gravity_cap = 1250
var weight = 150
var friction = 150;

var dealing = 0;
var launching = Vector2(0,0);
var damage = 0;
var stocks = 3;
var maxjumps = 1;
var jumps = maxjumps;
var onledge = false;
var atk_timer = 0;

func _ready() -> void:
	$Label.text = "Stocks: " + str(stocks)


func _physics_process(delta: float) -> void:
	if stocks < 1:
		get_tree().change_scene_to_file("res://scenes/debug_stages.tscn");
	
	if atk_timer > 0:
		attack_handler();
	
	if Input.is_action_just_pressed("Attack") && atk_timer == 0:
		attack();
	
	if (velocity.y < gravity_cap):
		velocity.y += gravity * delta
	
	if Input.is_action_pressed("Right"):
		if (not onledge):
			velocity.x = speed
	elif Input.is_action_pressed("Left"):
		if (not onledge):
			velocity.x = -speed;
	else:
		if velocity.x > 0:
			velocity.x -= friction/velocity.x
		if velocity.x < 0:
			velocity.x += (-friction)/velocity.x
	
	if Input.is_action_just_pressed("Jump"):
		gravity = 750;
		if is_on_floor():
			velocity.y = 0
			velocity.y -= jump_height
			jumps = maxjumps
		elif jumps > 0:
			if (not onledge):
				jumps -= 1;
			velocity.y = 0
			velocity.y -= jump_height
		onledge = false;
	if Input.is_action_just_released("Jump") && velocity.y <= 0:
		velocity.y -= velocity.y/2
	
		
	if Input.is_action_just_pressed("Down") && not is_on_floor():
		onledge = false;
		gravity = 750;
		velocity.y = gravity_cap;
		
	move_and_slide()

func just_hit(launch, taken):
	velocity.x = (launch.x - weight) * (1 + (damage / 10));
	velocity.y = (launch.y - weight) * (1 + (damage / 10));
	damage += taken;

func jumpset():
	jumps = maxjumps;
	
func die():
	print("You are dead")
	velocity.y = 0
	stocks -= 1
	$Label.text = "Stocks: " + str(stocks)
	position = Vector2(520,145)
	jumps = maxjumps

func attack():
	pass

func attack_handler():
	pass

func reset():
	pass

func _on_hurtbox_area_entered(area: Area2D) -> void:
	if (area.is_in_group("hitbox")):
		print("attacked at " + str(damage) + "% damage!")
		just_hit(area.get_parent().launching, area.get_parent().dealing);
