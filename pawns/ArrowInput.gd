tool # Add this line to run the code on the editor as well, allowing the arrow to be positioned onthe right place based on the Ready function, making editing more pleasant.
extends Sprite

onready var animPlayer = $AnimationPlayer
onready var collisionChecker = $RayCast2D

const direction = preload("../Globals/Direction.gd").direction

export(direction) var pointsTo := direction.UP

func _ready():
	if pointsTo == direction.UP:
		offset = Vector2(0,-16)
		animPlayer.play("UP")
		collisionChecker.rotation_degrees = 180 
	elif pointsTo == direction.DOWN:
		offset = Vector2(0,16)
		animPlayer.play("DOWN")
		collisionChecker.rotation_degrees = 0
	elif pointsTo == direction.LEFT:
		offset = Vector2(-16,0)
		animPlayer.play("LEFT")
		collisionChecker.rotation_degrees = 90 
	elif pointsTo == direction.RIGHT:
		offset = Vector2(16,0)
		animPlayer.play("RIGHT")
		collisionChecker.rotation_degrees = 270 

func _input(event):
	if visible and not collisionChecker.is_colliding() \
		and ((pointsTo == direction.UP and event.is_action_pressed("ui_up")) \
		or (pointsTo == direction.DOWN and event.is_action_pressed("ui_down")) \
		or (pointsTo == direction.LEFT and event.is_action_pressed("ui_left")) \
		or (pointsTo == direction.RIGHT and event.is_action_pressed("ui_right"))) :
			sendInput(pointsTo)


signal arrow_input_detected(direction)

func sendInput(inputDirection):
	print_debug("Input detected for: " + direction.keys()[inputDirection])
	emit_signal("arrow_input_detected",inputDirection)
