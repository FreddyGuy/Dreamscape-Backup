extends CharacterBody2D

signal respawned()

var health := 1
var WALK_SPEED = 500.0
var SHORT_JUMP_HEIGHT = -500.0
var SPRINT_SPEED = 600.0
var HIGH_JUMP_VELOCITY = -450.0
var FLOAT_SPEED = 400.0
var FLOAT = -300
var MAX_FALL_SPEED = -300.0
var IS_SPRINTING = false
var CAN_SPRINT = false

@onready var RESPAWN_POSITION = position 

@onready var Anim : AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		if abs(velocity.x) > 10:
			Anim.play("Run Cycle")
		else:
			Anim.play("Idle")
	
	if velocity.x < 0:
		Anim.flip_h = true
	else:
		if velocity.x > 1:
			Anim.flip_h = false


	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = FLOAT
		Anim.play("Jump")
	if Input.is_action_pressed("ui_accept") and not is_on_floor():
		velocity.y = FLOAT
		Anim.play("Jump")
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if IS_SPRINTING:
			velocity.x = direction * SPRINT_SPEED
		else: 
			velocity.x = direction * WALK_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, WALK_SPEED)
	if Input.is_action_pressed("Sprint"):
		WALK_SPEED = SPRINT_SPEED
	#if not is_on_floor():
		#velocity = CAN_FLOAT
		
		
	move_and_slide()
	
	# Respawn System
	
	if health <= 0:
		respawned.emit()
		Anim.play("POP!")

func respawn():
	position = RESPAWN_POSITION
	
