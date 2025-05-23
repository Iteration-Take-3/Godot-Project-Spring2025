extends Area2D

var x = position.x
var y = position.y
var ledge = false

<<<<<<< Updated upstream

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
=======
func _on_area_entered(area: Area2D) -> void:
	print(ledge)
	if area.get_parent().is_in_group("player"):
		ledge = true
		if (!area.get_parent().is_on_floor() && ledge):
			area.get_parent().gravity = 0;
			area.get_parent().velocity.x = 0;
			area.get_parent().velocity.y = 0;
			area.get_parent().jumpset();
			area.get_parent().onledge = true;
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
			await Input.is_anything_pressed()
			


<<<<<<< Updated upstream
<<<<<<< Updated upstream
func _on_body_exited(body: Node2D) -> void:
=======
func _on_area_exited(area: Area2D) -> void:
>>>>>>> Stashed changes
=======
func _on_area_exited(area: Area2D) -> void:
>>>>>>> Stashed changes
	ledge = false
