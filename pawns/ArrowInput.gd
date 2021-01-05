tool # Add this line to run the code on the editor as well, allowing the arrow to be positioned onthe right place based on the Ready function, making editing more pleasant.
extends Sprite

onready var animPlayer = $AnimationPlayer

const direction = preload("../Globals/Direction.gd").direction

export(direction) var dir := direction.UP

signal inputDetected(direction)

func _ready():
	if dir == direction.UP:
		offset = Vector2(0,-16)
		animPlayer.play("UP")
	elif dir == direction.DOWN:
		offset = Vector2(0,16)
		animPlayer.play("DOWN")
	elif dir == direction.LEFT:
		offset = Vector2(-16,0)
		animPlayer.play("LEFT")
	elif dir == direction.RIGHT:
		offset = Vector2(16,0)
		animPlayer.play("RIGHT")

func _input(event):
	if visible \
		and ((dir == direction.UP and event.is_action_pressed("ui_up")) \
		or (dir == direction.DOWN and event.is_action_pressed("ui_down")) \
		or (dir == direction.LEFT and event.is_action_pressed("ui_left")) \
		or (dir == direction.RIGHT and event.is_action_pressed("ui_right"))) :
			sendInput(dir)


func sendInput(dir):
	print_debug("Input detected for: " + direction.keys()[dir])
	emit_signal("inputDetected",dir)
