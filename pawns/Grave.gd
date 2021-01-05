extends StaticBody2D

const pawnTypes = preload("../Globals/PawnTypes.gd").pawnTypes

export(pawnTypes) var graveType

onready var AnimationPlayer = $AnimationPlayer

func _ready():
	match graveType:
		pawnTypes.Archeologist:
			$AnimationPlayer.play("Archeologist")
		pawnTypes.Carrier:
			$AnimationPlayer.play("Carrier")
		pawnTypes.Digger:
			$AnimationPlayer.play("Digger")
		pawnTypes.MachineExpert:
			$AnimationPlayer.play("MachineExpert")
		pawnTypes.Scout:
			$AnimationPlayer.play("Scout")
