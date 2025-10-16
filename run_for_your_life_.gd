extends Area2D

@export var player : CharacterBody2D
var speed = 400               
@onready var start_position = position
  
func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "Bubble":
		position = start_position
		body.respawn()
	


func _process(delta):
	#calculate direction to player
	var direction = (player.position - position).normalized()
	position += direction * speed * delta
