extends Area2D

var x = position.x
var y = position.y

func _on_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("player"):
		area.get_parent().position.x = 0;
		area.get_parent().position.y = 0;
		area.get_parent().velocity.x = 0;
		area.get_parent().velocity.y = 0;
		area.get_parent().djump = true;
