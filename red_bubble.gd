extends Area2D


func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "Bubble":
		body.respawn()


func _on_area_entered(area):
	pass # Replace with function body.
