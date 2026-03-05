extends CharacterBody3D

const FORWARD_SPEED := 10.0
const LANE_OFFSET := 3.0
const LANE_SPEED := 15.0
const GRAVITY := 30.0
const JUMP_FORCE := 12.0

var target_lane := 0

func _physics_process(delta):
	# Forward movement
	velocity.z = -FORWARD_SPEED

	# Gravity
	if not is_on_floor():
		velocity.y -= GRAVITY * delta
	else:
		velocity.y = 0

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_FORCE

	# Lane switching
	if Input.is_action_just_pressed("move_left"):
		target_lane = max(target_lane - 1, -1)
	if Input.is_action_just_pressed("move_right"):
		target_lane = min(target_lane + 1, 1)

	# Smooth X movement
	var desired_x = target_lane * LANE_OFFSET
	velocity.x = (desired_x - global_position.x) * LANE_SPEED

	# Move the player
	move_and_slide()
