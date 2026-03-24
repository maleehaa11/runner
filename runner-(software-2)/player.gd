extends CharacterBody3D

signal AddScore(score :int)

@export var Speed = 10.0
@export var JumpVelocity = 4.5
@export var LaneChangeSpeed = 5.0

enum Lane {LEFT = -1, CENTER = 0, RIGHT = 1}
enum State {RUNNING, JUMPING, SLIDING, DEAD}
var currentState : State = State.DEAD

var targetLane : int = Lane.CENTER
var currentLane : int = Lane.CENTER
@export var LaneWidth = 2.0
@export var SlidingDuration = .5
var currentSlidingDuration

# AnimationPlayer reference
@onready var anim_player = $Model/"Eve By J_Gonzales2"/AnimationPlayer

func _ready() -> void:
	currentSlidingDuration = SlidingDuration
	targetLane = Lane.CENTER
	currentLane = Lane.CENTER

func _physics_process(delta: float) -> void:
	if currentState != State.DEAD:

		# Gravity
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Jump
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JumpVelocity
			currentState = State.JUMPING
			anim_player.play("Running Jump/mixamo_com")

		# Lane movement
		var targetX = targetLane * LaneWidth
		position.x = lerp(position.x, targetX, LaneChangeSpeed * delta)

		# Lane switching
		if Input.is_action_just_pressed("ui_left") and targetLane > Lane.LEFT:
			targetLane -= 1
		if Input.is_action_just_pressed("ui_right") and targetLane < Lane.RIGHT:
			targetLane += 1

		# Slide
		if Input.is_action_just_pressed("ui_down") and is_on_floor():
			$StandingCollision.disabled = true
			currentState = State.SLIDING
			currentSlidingDuration = SlidingDuration
			anim_player.play("Running Slide/mixamo_com")

		# Sliding timer
		if currentState == State.SLIDING:
			currentSlidingDuration -= delta
			if currentSlidingDuration <= 0:
				currentState = State.RUNNING
				$StandingCollision.disabled = false
				anim_player.play("Running/mixamo_com")

		# Return to running after jump
		if currentState == State.JUMPING and is_on_floor():
			currentState = State.RUNNING
			anim_player.play("Running/mixamo_com")

		# Idle vs Run
		if currentState == State.RUNNING:
			anim_player.play("Running/mixamo_com")


	move_and_slide()

func _on_powerup_collider_area_entered(area: Area3D) -> void:
	if area is Pickup:
		AddScore.emit(area.Score)

func _on_game_manager_game_over(score: int) -> void:
	currentState = State.DEAD

func _on_game_manager_start_game() -> void:
	position = Vector3(0,0,0)
	currentState = State.RUNNING
	anim_player.play("Breathing Idle/mixamo_com")

func die():
	currentState = State.DEAD
	velocity = Vector3.ZERO
	get_node("/root/GameManager").GameOver.emit(0)
