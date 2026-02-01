extends Node2D

var button_type=null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#start
func _on_start_pressed() -> void:
	button_type="start"
	$fade_transition.show()
	$fade_transition/fade_timer.start()
	$fade_transition/AnimationPlayer.play("Fade in")

#Quit
func _on_quit_game_pressed() -> void:
	get_tree().quit()

#Stage Select
func _on_stage_select_pressed() -> void:
	button_type="option"
	$fade_transition.show()
	$fade_transition/fade_timer.start()
	$fade_transition/AnimationPlayer.play("Fade in")
	$Labels/AnimationPlayer.play("fade_in")
#Reset Data
func _on_reset_data_pressed() -> void:
	pass # Replace with function body.


func _on_fade_timer_timeout() -> void:
	if button_type=="start":
		get_tree().change_scene_to_file("res://scenes/game.tscn")
