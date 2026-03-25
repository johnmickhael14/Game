extends Area2D
var PlayerController: PlayerController
@onready var next_stage: Area2D = $"."

func _on_body_entered(body: Node2D) -> void:
	print(GameManager.scene)
	if body is PlayerController and GameManager.scene == 1:
		get_tree().change_scene_to_file("res://scenes/game_2.tscn")
		GameManager.scene=2
	elif body is PlayerController and GameManager.scene == 2:
		get_tree().change_scene_to_file("res://scenes/game_3.tscn")
		GameManager.scene=3
	elif body is PlayerController and GameManager.scene == 3:
		get_tree().change_scene_to_file("res://scenes/game_4.tscn")
		GameManager.scene=4
	elif body is PlayerController and GameManager.scene == 4:
		get_tree().change_scene_to_file("res://scenes/game_end.tscn")
		#GameManager.scene=5
	#elif body is PlayerController and GameManager.scene == 5:
	#	get_tree().change_scene_to_file("res://scenes/game_end.tscn")
