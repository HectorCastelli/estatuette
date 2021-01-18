extends KinematicBody2D

const cellSize = 16

signal turn_end

const direction = preload("../Globals/Direction.gd").direction
onready var Arrows = $Arrows

export(Resource) var pawnRules

func _ready():
	Arrows.connect("attempt_pawn_movement", self, "tryMove")
	Arrows.setHoleDetection(pawnRules.canVaultOverHoles)
	Arrows.setBreakableWallDetection(pawnRules.canBreakWalls)
	# if (pawnRules):
		# updatePossibleMovement()

func _input(event):
	if tween.is_active():
		# print("no movement allowed")
		return
	if event.is_action_pressed("ui_cancel"):
		position = originalPosition
		moveInputs.clear()
		movementModifiers = {}
		updatePossibleMovement()
	if event.is_action_pressed("ui_accept"):
		if checkNextMove().empty():
			moveInputs.clear()
			movementModifiers = {}
			emit_signal("turn_end")
			print("end turn")
		else:
			print("Cannot end turn! There are still moves to be done!")
		

# Movement logic
onready var tween = $Tween
export var movementSpeed =3

var originalPosition
func tryMove(dir):
	if moveInputs.empty(): #Only for the first movement for the turn.
		originalPosition = position
	moveInputs.append(dir)
	match dir:
		direction.UP:
			tween_move(0, -1)
		direction.DOWN:
			tween_move(0, 1)
		direction.LEFT:
			tween_move(-1, 0)
		direction.RIGHT:
			tween_move(1, 0)
	Arrows.hideAll()

func tween_move(xPos, yPos):
	tween.interpolate_property(self, "position",
		position, position + Vector2(xPos,yPos) * cellSize,
		1.0/movementSpeed, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
	pass

func _on_Tween_tween_all_completed():
	updatePossibleMovement()
	pass # Replace with function body.

func updatePossibleMovement():
	Arrows.hideAll()
	var newMoves = checkNextMove()
	for move in newMoves:
		Arrows.showArrow(move)

# Movement Rule detection
var moveInputs := []
var movementModifiers := {}

func patchMovementRules(basePatterns, modifiers):
	if modifiers.empty():
		return basePatterns
	var result
	var patchedForLastModifier = []
	for modifierIndex in modifiers:
		var patchedPatterns = []
		for basePattern in patchedForLastModifier if not patchedForLastModifier.empty() else basePatterns:
			var newRules = patchMovementRules_SingleModifier(basePattern, modifierIndex, modifiers.get(modifierIndex))
			if not newRules.empty():
				for newRule in newRules:
					patchedPatterns.append(newRule)
		patchedForLastModifier = patchedPatterns
	result = patchedForLastModifier
	return result

func patchMovementRules_SingleModifier(basePattern, modifierIndex, modifierValues):
	var result := []
	for modifierValue in modifierValues:
		var beforeMod; var afterMod
		match(modifierIndex):
			0:
				beforeMod = []
				afterMod = basePattern
			1:
				beforeMod = [basePattern[0]]
				afterMod = basePattern.slice(1, basePattern.size())
			_:
				beforeMod = basePattern.slice(0,modifierIndex)
				afterMod = basePattern.slice(modifierIndex, basePattern.size())
				
		var modifiedPattern = beforeMod if not beforeMod.empty() else Array()
		modifiedPattern.append(modifierValue)
		if not afterMod.empty():
			for moveDir in afterMod:
				modifiedPattern.append(moveDir)
		
		result.append(modifiedPattern)
	return result

func checkNextMove():
	var allowedMoves := []
	var patchedRules = patchMovementRules(pawnRules.patterns, movementModifiers)
	for movementPattern in patchedRules:
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

func addMovementModifier(newMovementRules):
	print("Movement rules added")
	movementModifiers[moveInputs.size()] = newMovementRules
	pass

func test():
	print("test")
