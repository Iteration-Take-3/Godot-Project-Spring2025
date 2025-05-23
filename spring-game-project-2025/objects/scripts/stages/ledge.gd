extends Area2D

var x = position.x
var y = position.y
var ledge = false


func _on_body_entered(body: Node2D) -> void:
	print(body)
	if body.is_in_group("player"):
		ledge = true
		if (!body.is_on_floor() && ledge):
			body.gravity = 0;
			body.velocity.x = 0;
			body.velocity.y = 0;
			body.jumpset();
			body.onledge = true;
			await Input.is_anything_pressed()
			


func _on_body_exited(body: Node2D) -> void:
	ledge = false
