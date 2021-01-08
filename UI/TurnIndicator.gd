extends CenterContainer

onready var label = $Label
onready var animationPlayer = $AnimationPlayer

export var playerTurnText := "Your Turn!"
export var endTurnText := "Turn Ended"

signal start_turn_animation_finished
signal end_turn_animation_finished

func startPlayerTurn():
	label.text = playerTurnText
	animationPlayer.play("StartTurn")
	emit_signal("start_turn_animation_finished")
	
func endPlayerTurn():
	label.text = endTurnText
	animationPlayer.play("EndTurn")
	emit_signal("end_turn_animation_finished")

