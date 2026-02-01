extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#start
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

#Quit
func _on_quit_game_pressed() -> void:
	get_tree().quit()

#Stage Select
func _on_stage_select_pressed() -> void:
	pass # Replace with function body.

#Reset Data
func _on_reset_data_pressed() -> void:
	pass # Replace with function body.
