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


func _ready() -> void:
	currentSlidingDuration = SlidingDuration
	targetLane = Lane.CENTER
	currentLane = Lane.CENTER

func _physics_process(delta: float) -> void:
	if currentState != State.DEAD:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JumpVelocity
		
		var targetX = targetLane * LaneWidth
		position.x = lerp(position.x, targetX, LaneChangeSpeed * delta)
		
		if Input.is_action_just_pressed("ui_left") and targetLane > Lane.LEFT:
			targetLane -= 1
		if Input.is_action_just_pressed("ui_right") and targetLane < Lane.RIGHT:
			targetLane += 1
		if Input.is_action_just_pressed("ui_down") and is_on_floor :
			$StandingCollision.disabled = true
			currentState = State.SLIDING
			currentSlidingDuration = SlidingDuration
			
		if currentState == State.SLIDING:
			currentSlidingDuration -= delta
			if currentSlidingDuration <= 0:
				currentState = State.RUNNING
				$StandingCollision.disabled = false
	
	move_and_slide()


func _on_powerup_collider_area_entered(area: Area3D) -> void:
	if area is Pickup:
		AddScore.emit(area.Score)
	pass # Replace with function body.


func _on_game_manager_game_over(score: int) -> void:
	currentState = State.DEAD
	pass # Replace with function body.


func _on_game_manager_start_game() -> void:
	position = Vector3(0,0,0)
	currentState = State.RUNNING
	pass # Replace with function body.

func die():
	currentState = State.DEAD
	velocity = Vector3.ZERO
	get_node("/root/GameManager").GameOver.emit(0)
