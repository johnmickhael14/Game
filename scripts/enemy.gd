extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED=60
# Called when the node enters the scene tree for the first time.
var direction=1
@onready var ray_left: RayCast2D = $RayLeft
@onready var ray_right: RayCast2D = $RayRight




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_left.is_colliding():
		direction=1
		animated_sprite_2d.flip_h=false
	if ray_right.is_colliding():
		direction=-1
		animated_sprite_2d.flip_h=true
	position.x+=direction*SPEED*delta
