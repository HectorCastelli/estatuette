extends KinematicBody2D

const direction = preload("../Globals/Direction.gd").direction
onready var Arrows = $Arrows

export var movementPatternRules := [
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

func tryMove(dir):
	moveInputs.append(dir)
	match dir:
		direction.UP:
			position.y -= 16
		direction.DOWN:
			position.y += 16
		direction.LEFT:
			position.x -= 16
		direction.RIGHT:
			position.x += 16
			
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
