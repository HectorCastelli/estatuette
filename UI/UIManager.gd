extends Control

onready var turnIndicator = $TurnIndicator

func _ready():
	turnIndicator.connect("end_turn_animation_finished",self,"next_AI_turn")
	turnIndicator.connect("end_turn_animation_finished",self,"next_player_turn")

func pawn_turn_end():
	turnIndicator.endPlayerTurn()
	
func AI_turn_end():
	turnIndicator.startPlayerTurn()

signal next_AI_turn
func next_AI_turn():
	emit_signal("next_AI_turn")
	
signal next_player_turn
func next_player_turn():
	emit_signal("next_player_turn")
