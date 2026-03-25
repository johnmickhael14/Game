extends AnimatableBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("RESET")
	print("platform stop")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_lever_body_entered(body: Node2D) -> void:
	animation_player.play("move1")
