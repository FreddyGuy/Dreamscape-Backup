extends Area2D


func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "Bubble":
		get_tree().change_scene_to_file("res://level_below_selection.tscn")
