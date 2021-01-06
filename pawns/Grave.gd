extends StaticBody2D

const pawnTypes = preload("../Globals/PawnTypes.gd").pawnTypes

export(pawnTypes) var graveType

onready var animationPlayer = $AnimationPlayer

func _ready():
	match graveType:
		pawnTypes.Archeologist:
			animationPlayer.play("Archeologist")
		pawnTypes.Carrier:
			animationPlayer.play("Carrier")
		pawnTypes.Digger:
			animationPlayer.play("Digger")
		pawnTypes.MachineExpert:
			animationPlayer.play("MachineExpert")
		pawnTypes.Scout:
			animationPlayer.play("Scout")
