extends Resource

const direction = preload("../Globals/Direction.gd").direction

export(bool) var canBreakWalls := false

export(bool) var canVaultOverHoles := false

export(Array, Array, direction) var patterns := [
	[direction.UP,direction.UP],
	[direction.DOWN,direction.DOWN],
	[direction.LEFT,direction.LEFT],
	[direction.RIGHT,direction.RIGHT],
]

export (Array, direction) var deathMovements := [
	direction.UP, direction.DOWN, direction.LEFT, direction.RIGHT
]
