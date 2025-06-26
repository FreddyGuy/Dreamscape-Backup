extends CharacterBody2D


var WALK_SPEED = 200.0
var SHORT_JUMP_VELOCITY = -200.0
var SPRINT_SPEED = 450.0
var HIGH_JUMP_VELOCITY = -450.0
var FLOAT_SPEED = 800
var IS_SPRINTING = false
var CAN_SPRINT = false
var IS_FLOATING = false
var CAN_FLOAT = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = SHORT_JUMP_VELOCITY

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
		

	move_and_slide()
