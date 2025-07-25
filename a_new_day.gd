extends Node2D

@onready var Respawn: Marker2D = $Respawn

func _ready() -> void:
	for player in get_tree().get_nodes_in_group("player"):
		player.respawned.connect(_on_player_respawned.bind(player))
		
func _on_player_respawned(player):
	player.global_position = Marker2D.global_position


func _on_area_2d_body_entered(body):
	pass # Replace with function body.
