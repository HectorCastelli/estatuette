extends StaticBody2D

onready var animation = $AnimationPlayer

func _on_Area2D_body_entered(body):
	print("WALL WAS HIT BY: ",body.name)
	#animation.play("Break")
	pass # Replace with function body.
