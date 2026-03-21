extends Node3D

signal ScoreUpdated(score: int)
signal GameOver(score: int)
signal StartGame()
var score : int = 0

@export var ObstacleScene : Array[PackedScene] = []
@export var PowerupsScene : Array[PackedScene] = []
@export var MinSpawnTime : float = 1.0
@export var MaxSpawnTime : float = 2.0
@export var SpawnDistance : float = -20.0
@export var PickupableSpawnChance : float = 0.3

var lanePositions = [-2.0, 0.0, 2.0]
var speedMultiplayer : float = 1.0

func _on_spawn_timer_timeout() -> void:
	var randValue = randf()

	# Decide whether to spawn a pickup or an obstacle
	if randValue < PickupableSpawnChance:
		# SPAWN POWERUP
		var powerScene = PowerupsScene[randi() % PowerupsScene.size()]
		var powerup = powerScene.instantiate()

		var lane = randi() % 3
		powerup.position = Vector3(lanePositions[lane], 0.3, SpawnDistance)
		powerup.Speed = powerup.Speed * speedMultiplayer

		$ObstacleContainer.add_child(powerup)
		$SpawnTimer.wait_time = randf_range(MinSpawnTime, MaxSpawnTime)

	else:
		# SPAWN OBSTACLE
		var scene = ObstacleScene[randi() % ObstacleScene.size()]
		var obstacle = scene.instantiate()

		# Check obstacle type
		if obstacle.CurrentObstacleType == Obstacle.ObstacleType.LOW \
		or obstacle.CurrentObstacleType == Obstacle.ObstacleType.HIGH:

			# Single obstacle in the center lane
			obstacle.position = Vector3(0, 0, SpawnDistance)
			obstacle.Speed = obstacle.Speed * speedMultiplayer
			$ObstacleContainer.add_child(obstacle)
			

		else:
			# Standard obstacle: block 2 lanes, leave 1 open
			var openLane = randi() % 3

			for i in range(3):
				if i != openLane:
					var ob = scene.instantiate()
					ob.position = Vector3(lanePositions[i], 0, SpawnDistance)
					$ObstacleContainer.add_child(ob)
					obstacle.Speed = obstacle.Speed * speedMultiplayer


	pass # Replace with function body.


func _on_score_timer_timeout() -> void:
	@warning_ignore("narrowing_conversion")
	score += 1 + (1 * speedMultiplayer)
	speedMultiplayer = clamp(speedMultiplayer, 1.0, 5.0)
	ScoreUpdated.emit(score)
	pass # Replace with function body.


func _on_player_add_score(_score: int) -> void:
	@warning_ignore("narrowing_conversion")
	self.score += score + (score * speedMultiplayer)
	speedMultiplayer += 0.04
	ScoreUpdated.emit(self.score)
	pass # Replace with function body.


func _on_death_plane_area_entered(_area: Area3D) -> void:
	$SpawnTimer.stop()
	$ScoreTimer.stop()
	GameOver.emit(score)
	pass # Replace with function body.


func _on_ui_manager_start_game() -> void:
	score = 0
	speedMultiplayer = 1.0
	$ScoreTimer.start()
	$SpawnTimer.start()
	ScoreUpdated.emit(score)
	StartGame.emit()
	pass # Replace with function body.
