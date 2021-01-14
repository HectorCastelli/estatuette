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

func _on_Area2D_body_entered(body):
	var movementToAdd
	match graveType:
		pawnTypes.Archeologist:
			movementToAdd = preload("res://pawns/PawnRules/Archeologist.tres").deathMovements
		pawnTypes.Carrier:
			# movementToAdd = preload("res://pawns/PawnRules/Carrier.tres")
			pass
		pawnTypes.Digger:
			movementToAdd = preload("res://pawns/PawnRules/Digger.tres").deathMovements
		pawnTypes.MachineExpert:
			movementToAdd = preload("res://pawns/PawnRules/MachineExpert.tres").deathMovements
		pawnTypes.Scout:
			# movementToAdd = preload("res://pawns/PawnRules/Scout.tres")
			pass
	body.addMovementModifier(movementToAdd)
	pass # Replace with function body.
