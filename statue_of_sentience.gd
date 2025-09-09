extends Area2D

func _ready():
	var start_position = self.position
	var tween = create_tween()
	var end_position = start_position - Vector2(0,554)
	tween.tween_property(self, "position", end_position, 2.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position", start_position, 2.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.set_loops()

func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "Bubble":
		body.respawn()
