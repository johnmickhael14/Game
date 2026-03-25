extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_left: RayCast2D = $RayLeft
@onready var ray_right: RayCast2D = $RayRight

const SPEED = 60
const GRAVITY = 1000

var direction = 1

func _physics_process(delta):
	# Apply gravity automatically
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0

	# Horizontal movement
	if ray_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	if ray_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true

	velocity.x = direction * SPEED

	# Move the enemy with collision
	move_and_slide()
