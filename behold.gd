extends Label

func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "Bubble":
		body.respawn()
