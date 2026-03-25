extends Area2D
@onready var sprite_2d: ColorRect = $Sprite2D

var inside:bool = false
func _process(delta: float) -> void:
	if inside and Input.is_action_just_pressed("ui_down"):
		#get_tree().change_scene_to_file("res://scenes/game.tscn")
		print("stage3")
func _on_body_entered(body: Node2D) -> void:
	sprite_2d.modulate = Color(0, 1, 0)
	inside=true
func _on_body_exited(body: Node2D) -> void:
	sprite_2d.modulate = Color(1, 1, 1)
	inside=false
