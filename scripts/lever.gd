extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@export var flipped=false
var player_inside = false

		
func _on_body_entered(body: Node2D) -> void:
	sprite_2d.flip_h=true
	flipped=false
		
func _on_body_exited(body: Node2D) -> void:
	player_inside= false
