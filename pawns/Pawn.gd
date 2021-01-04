extends KinematicBody2D

const direction = preload("../Globals/Direction.gd").direction
onready var Arrows = $Arrows

export var possibleMovement := [
	[direction.UP,direction.UP],
	[direction.DOWN,direction.DOWN],
	[direction.LEFT,direction.LEFT],
	[direction.RIGHT,direction.RIGHT],
]

# Called when the node enters the scene tree for the first time.
func _ready():
	Arrows.hideAll()
	Arrows.showArrow(direction.UP)
	pass # Replace with function body.
