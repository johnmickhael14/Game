extends Area2D
var PlayerController: PlayerController

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		print("hello")
