extends KinematicBody2D

const direction = preload("../Globals/Direction.gd")
onready var Arrows = $Arrows

export var possibleMovement := [
	[direction.direction.UP,direction.direction.UP],
	[direction.direction.DOWN,direction.direction.DOWN],
	[direction.direction.LEFT,direction.direction.LEFT],
	[direction.direction.RIGHT,direction.direction.RIGHT],
]

# Called when the node enters the scene tree for the first time.
func _ready():
	Arrows.hideAll()
	pass # Replace with function body.
