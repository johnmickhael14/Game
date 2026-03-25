extends StaticBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var open: bool = false
var six: bool = false
var seven: bool = false
func check_door() -> void:
	if six == true and seven == true:
		animation_player.play("open")
		await get_tree().create_timer(0.7).timeout
		animation_player.play("gone")
	else:
		animation_player.play("rest")
	
		
func _on_pressure_plate_body_entered(body: Node2D) -> void:
	if open==false:
		open=true
		animation_player.play("open")
		await get_tree().create_timer(0.7).timeout
		animation_player.play("gone")

func _on_pressure_plate_body_exited(body: Node2D) -> void:
	animation_player.play("rest")
	

func _on_pressure_6_body_entered(body: Node2D) -> void:
	six=true
	check_door()

func _on_pressure_6_body_exited(body: Node2D) -> void:
	six=false
	check_door()

func _on_pressure_7_body_entered(body: Node2D) -> void:
	seven=true
	check_door()

func _on_pressure_7_body_exited(body: Node2D) -> void:
	seven=false
	check_door()	
