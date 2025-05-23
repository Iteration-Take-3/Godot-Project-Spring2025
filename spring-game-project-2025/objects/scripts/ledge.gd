extends Area2D

var x = position.x
var y = position.y
var ledge = false

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
			await Input.is_anything_pressed()
			


func _on_area_exited(area: Area2D) -> void:
	ledge = false
