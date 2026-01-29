extends CharacterBody2D

@onready var animated_sprite=$AnimatedSprite2D
const SPEED = 150.0
const JUMP_VELOCITY = -250.0
var temp_jump=0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and temp_jump!=1:
		velocity.y = JUMP_VELOCITY
		temp_jump=temp_jump+1
	if is_on_floor():
		temp_jump=0
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if Input.is_action_pressed("ui.slow"):
		Engine.time_scale = 0.5
	if not Input.is_action_pressed("ui.slow"):
		Engine.time_scale = 1
		
	if direction==1:
		animated_sprite.flip_h=false
	elif direction==-1:
		animated_sprite.flip_h=true
		
	if direction==0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("idle")
	if direction:
		velocity.x = direction * SPEED 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
