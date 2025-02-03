#extends CanvasLayer
##Notifies Main node that button pressed
#signal start_game
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#SignalBus.connect("_player_death", show_game_over())
	#pass # Replace with function body.
#func show_message(text, fade):
	#$Message.text = text
	#$Message.show()
	#if fade:
		#$MessageTimer.start()
	#
#func show_game_over():
	#show_message("Game Over ):", 0)
	##await $MessageTimer.timeout
	#
	##Make a one-shot timer and wait for it to finish.
	#await get_tree().create_timer(1.0).timeout
	#$StartButton.show()
#
#func update_score(score):
	#$ScoreLabel.text = str(score)
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
#
#
#func _on_start_button_pressed() -> void:
	#$StartButton.hide()
	#$Message.hide()
	#start_game.emit()
	#
#func _on_message_timer_timeout() -> void:
	#$Message.hide()
