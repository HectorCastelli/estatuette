extends Node2D

onready var pawn = $Pawn
onready var playerUI = $"Player UI"

func _ready():
	pawn.connect("turn_end", self, "pawn_turn_end")
	playerUI.connect("next_player_turn", self, "pawn_new_turn")
	pass

func pawn_turn_end():
	playerUI.pawn_turn_end()

func pawn_new_turn():
	pawn.updatePossibleMovement()
	
func AI_new_turn():
	print("AI TURN CONTROLLER HERE")
	playerUI.AI_turn_end()
