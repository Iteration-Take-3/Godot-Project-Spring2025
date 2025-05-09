extends CollisionShape2D


func _on_area_entered(area: Area2D) -> void:
	if area.parent.is_in_group("player"):
		area.parent.position.x = position.x;
