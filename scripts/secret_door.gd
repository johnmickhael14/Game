extends StaticBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var open: bool = false


func _on_pressure_plate_body_entered(body: Node2D) -> void:
	if open==false:
		open=true
		animation_player.play("open")
		await get_tree().create_timer(0.7).timeout
		animation_player.play("gone")
		
		
		


func _on_pressure_plate_body_exited(body: Node2D) -> void:
	if open==true:
		animation_player.play("rest")
		open=false
	
