extends Area2D
var PlayerController: PlayerController
@onready var next_stage: Area2D = $"."

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		get_tree().change_scene_to_file("res://scenes/secret_ending.tscn")
