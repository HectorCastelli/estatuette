extends KinematicBody2D

const cellSize = 16

const direction = preload("../Globals/Direction.gd").direction
onready var Arrows = $Arrows

export(Array, Array, direction) var movementPatternRules := [
	[direction.UP,direction.UP],
	[direction.DOWN,direction.DOWN],
	[direction.LEFT,direction.LEFT],
	[direction.RIGHT,direction.RIGHT],
]

func _ready():
	Arrows.hideAll()
	Arrows.connect("tryToMovePawn", self, "tryMove")
	updatePossibleMovement()
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		position = originalPosition
		moveInputs.clear()
		updatePossibleMovement()
	if event.is_action_pressed("ui_accept"):
		if checkNextMove().empty():
			print("end turn")
		else:
			print("Cannot end turn! There are still moves to be done!")
		

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
	pass

func updatePossibleMovement():
	Arrows.hideAll()
	var newMoves = checkNextMove()
	if newMoves.empty():
		print("NO MOVES POSSIBLE!")
	else:
		for move in newMoves:
			Arrows.showArrow(move)

# Movement Rule detection
var moveInputs := []

func checkNextMove():
	var allowedMoves := []
	for movementPattern in movementPatternRules:
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
