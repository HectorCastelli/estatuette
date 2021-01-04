extends Sprite

onready var animPlayer = $AnimationPlayer

const direction = preload("../Globals/Direction.gd")

export(direction.direction) var dir := direction.direction.UP

signal inputDetected(direction)

func _ready():
	if dir == direction.direction.UP:
		offset = Vector2(0,-16)
		animPlayer.play("UP")
	elif dir == direction.direction.DOWN:
		offset = Vector2(0,16)
		animPlayer.play("DOWN")
	elif dir == direction.direction.LEFT:
		offset = Vector2(-16,0)
		animPlayer.play("LEFT")
	elif dir == direction.direction.RIGHT:
		offset = Vector2(16,0)
		animPlayer.play("RIGHT")

func _input(event):
	if dir == direction.direction.UP && event.is_action_pressed("ui_up"):
		emit_signal("inputDetected",dir)
	elif dir == direction.direction.DOWN && event.is_action_pressed("ui_down"):
		emit_signal("inputDetected",dir)
	elif dir == direction.direction.LEFT && event.is_action_pressed("ui_left"):
		emit_signal("inputDetected",dir)
	elif dir == direction.direction.RIGHT && event.is_action_pressed("ui_right"):
		emit_signal("inputDetected",dir)
