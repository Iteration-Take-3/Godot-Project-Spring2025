extends Area2D

var x = position.x
var y = position.y

func _on_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("player"):
		area.get_parent().gravity = 0;
		area.get_parent().velocity.x = 0;
		area.get_parent().velocity.y = 0;
		area.get_parent().djump = true;
		area.get_parent().canmove = false;
