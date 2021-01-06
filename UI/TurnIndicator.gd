extends CenterContainer

onready var label = $Label
onready var animationPlayer = $AnimationPlayer

export var playerTurnText := "Your Turn!"
export var endTurnText := "Turn Ended"

func startPlayerTurn():
	label.text = playerTurnText
	animationPlayer.play("StartTurn")
	
func endPlayerTurn():
	label.text = endTurnText
	animationPlayer.play("EndTurn")

