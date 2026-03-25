extends AnimatableBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("RESET_2")
	print("platform stop")



func _on_pressure_plate_2_body_entered(body: Node2D) -> void:
	animation_player.play("move2")
	print("hello")


func _on_pressure_plate_2_body_exited(body: Node2D) -> void:
	animation_player.play("RESET_2")
	print("hi")
