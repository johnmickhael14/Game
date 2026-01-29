extends CharacterBody2D

@onready var animated_sprite=$AnimatedSprite2D
var SPEED = 150.0
const JUMP_VELOCITY = -250.0
var temp_jump=0
@onready var tile_map: TileMap = $"../TileMap"

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and temp_jump!=2:
		velocity.y = JUMP_VELOCITY
		temp_jump=temp_jump+1
	if is_on_floor():
		temp_jump=0
	
	if Input.is_action_pressed("ui_down") and is_on_floor():
		velocity.x=0	
		animated_sprite.play("kneel")
		SPEED=0
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if Input.is_action_pressed("ui.slow"):
		Engine.time_scale = 0.5
		tile_map.modulate="898989"
	elif not Input.is_action_pressed("ui.slow"):
		Engine.time_scale = 1
		tile_map.modulate=Color.WHITE
		
	if direction==1:
		animated_sprite.flip_h=false
	elif direction==-1:
		animated_sprite.flip_h=true
		
	if direction==0 and not Input.is_action_pressed("ui_down"):
		animated_sprite.play("idle")
		
	elif direction==1 and not Input.is_action_pressed("sprint") or direction==-1 and not Input.is_action_pressed("sprint"):
		animated_sprite.play("run")
		
	if Input.is_action_pressed("sprint") and direction!=0:
		SPEED=150
		velocity.x = direction * SPEED*2
		animated_sprite.play("roll")
		
		
	elif direction and not Input.is_action_pressed("sprint") and not Input.is_action_pressed("ui_down"):
		SPEED=150
		velocity.x = direction * SPEED 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
