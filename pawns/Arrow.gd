extends Node2D

const direction = preload("../Globals/Direction.gd")

onready var ArrowUP = $Arrow_Up
onready var ArrowDOWN = $Arrow_Down
onready var ArrowLEFT = $Arrow_Left
onready var ArrowRIGHT = $Arrow_Right

func showArrow(dir):
	if (dir == direction.direction.UP):
		ArrowUP.visible = true
	elif (dir == direction.direction.DOWN):
		ArrowDOWN.visible = true
	elif (dir == direction.direction.LEFT):
		ArrowLEFT.visible = true
	elif (dir == direction.direction.RIGHT):
		ArrowRIGHT.visible = true

func hideArrow(dir):
	if (dir == direction.direction.UP):
		ArrowUP.visible = false
	elif (dir == direction.direction.DOWN):
		ArrowDOWN.visible = false
	elif (dir == direction.direction.LEFT):
		ArrowLEFT.visible = false
	elif (dir == direction.direction.RIGHT):
		ArrowRIGHT.visible = false

func hideAll():
	ArrowUP.visible = false
	ArrowDOWN.visible = false
	ArrowLEFT.visible = false
	ArrowRIGHT.visible = false
