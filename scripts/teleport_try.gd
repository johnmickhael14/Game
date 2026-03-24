extends Area2D
var PlayerController: PlayerController

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
