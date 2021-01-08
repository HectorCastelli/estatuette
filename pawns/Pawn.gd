extends KinematicBody2D

const cellSize = 16

signal turn_end

const direction = preload("../Globals/Direction.gd").direction
onready var Arrows = $Arrows

export(Resource) var movementRules

func _ready():
	Arrows.connect("attempt_pawn_movement", self, "tryMove")
	# if (movementRules):
		# updatePossibleMovement()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		position = originalPosition
		moveInputs.clear()
		updatePossibleMovement()
	if event.is_action_pressed("ui_accept"):
		if checkNextMove().empty():
			moveInputs.clear()
			emit_signal("turn_end")
			print("end turn")
		else:
			print("Cannot end turn! There are still moves to be done!")
		

# Movement logic
var originalPosition
func tryMove(dir):
	if moveInputs.empty(): #Only for the first movement for the turn.
		originalPosition = position
	moveInputs.append(dir)
	match dir:
		direction.UP:
			position.y -= cellSize
		direction.DOWN:
			position.y += cellSize
		direction.LEFT:
			position.x -= cellSize
		direction.RIGHT:
			position.x += cellSize
	updatePossibleMovement()

func updatePossibleMovement():
	Arrows.hideAll()
	var newMoves = checkNextMove()
	for move in newMoves:
		Arrows.showArrow(move)

# Movement Rule detection
var moveInputs := []

func checkNextMove():
	var allowedMoves := []
	for movementPattern in movementRules.patterns:
		var allowedMove = checkPattern(movementPattern, moveInputs)
		if allowedMove != null:
			allowedMoves.append(allowedMove)
	return allowedMoves
	
func checkPattern(movementRule, movementInput):
	if (movementInput.empty()):
		return movementRule[0]
	for moveInputIndex in movementInput.size():
		if (movementInput[moveInputIndex] != movementRule[moveInputIndex]):
			return null
	if movementInput.size() < movementRule.size():
		return movementRule[movementInput.size()]
