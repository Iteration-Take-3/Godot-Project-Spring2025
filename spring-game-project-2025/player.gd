extends CharacterBody2D

const speed = 500
const gravity = 750
const jump_height = 500
const gravity_cap = 10000

var stocks = 3
var djump = true;

func _ready() -> void:
	$Label.text = "Stocks: " + str(stocks)


func _physics_process(delta: float) -> void:
	
	velocity.x = 0
	if (velocity.y < gravity_cap):
		velocity.y += gravity * delta
	
	if Input.is_action_pressed("Right"):
		velocity.x += speed
	if Input.is_action_pressed("Left"):
		velocity.x -= speed
	
	if Input.is_action_just_pressed("Jump"):
		if is_on_floor():
			velocity.y = 0
			velocity.y -= jump_height
			djump = true
		elif djump:
			djump = false
			velocity.y = 0
			velocity.y -= jump_height
	if Input.is_action_just_released("Jump") && velocity.y <= 0:
		velocity.y -= velocity.y/2
	
	if stocks < 1:
		get_tree().quit()
		
	if Input.is_action_just_pressed("Down") && not is_on_floor():
		velocity.y = 750;
		
	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	velocity.y = 0
	stocks -= 1
	$Label.text = "Stocks: " + str(stocks)
	position = Vector2(520,145)
	djump = true
	
	
