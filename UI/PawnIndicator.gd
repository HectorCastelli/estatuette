extends Control

const pawnTypes = preload("../Globals/PawnTypes.gd").pawnTypes

export(pawnTypes) var indicatorType
export(int) var unitCount = 1 setget setUnitCount

onready var animationPlayer = $AnimationPlayer
onready var labelCount = $Label

func setUnitCount(value):
	unitCount = value
	labelCount.text = str(unitCount)

func _ready():
	labelCount.text = str(unitCount)
	match indicatorType:
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

