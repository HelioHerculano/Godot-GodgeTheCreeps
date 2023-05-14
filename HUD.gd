extends CanvasLayer

signal start_game

func _ready():
	pass # Replace with function body.

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Fim de Jogo")
	yield($MessageTimer,"timeout")

	$Message.text = "Desvie e sobreviva aos monstros!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	yield(get_tree().create_timer(1.0),"timeout")
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$Message.hide()
