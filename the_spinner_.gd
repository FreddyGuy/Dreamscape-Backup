extends Area2D


# Called when the node enters the scene tree for the first time.
func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "Bubble":
		body.respawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation_degrees += 100 * delta
	
	
