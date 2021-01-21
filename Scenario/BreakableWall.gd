extends StaticBody2D

onready var animation = $AnimationPlayer

func _on_Area2D_body_entered(body):
	print("WALL WAS HIT BY: ",body.name)
	animation.play("Break")
	pass # Replace with function body.

const explosionEffect = preload("res://Effects/WallBreakEffect.tscn")

func spawnExplosionEffect():
	var explodeEffect = explosionEffect.instance()
	explodeEffect.global_position = self.global_position
	get_tree().get_root().add_child(explodeEffect)
	print("boom")
	# add_child_below_node(get_tree().get_root(),explodeEffect)
	# explodeEffect.global_position = self.global_position
