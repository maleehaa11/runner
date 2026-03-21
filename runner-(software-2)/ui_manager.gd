extends Control

signal StartGame

func _on_game_manager_score_updated(score: int) -> void:
	$RichTextLabel.text = "Score" + str(score)

	pass # Replace with function body.


func _on_game_manager_game_over(score: int) -> void:
	$GameOverContainer.show()
	$GameOverContainer/VBoxContainer/ScoreLabel.text = "Score: " + str(score)
	pass # Replace with function body.


func _on_button_button_down() -> void:
	StartGame.emit()
	$GameOverContainer.hide()
	$StartGameContainer.hide()
	pass # Replace with function body.
