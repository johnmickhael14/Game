extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var open: bool = true
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("box") or body.is_in_group("player"):
		animated_sprite.play("pressed")
		open=true
func _on_body_exited(body: Node2D) -> void:
	animated_sprite.play("unpressed")
	open=false
