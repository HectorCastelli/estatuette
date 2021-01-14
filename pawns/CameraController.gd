extends Camera2D

export(NodePath) var tilemapTarget
onready var tilemap = get_node(tilemapTarget)

func set_camera_limits():
	var map_limits = tilemap.get_used_rect()
	var map_cellsize = tilemap.cell_size
	limit_left = map_limits.position.x * map_cellsize.x
	limit_right = map_limits.end.x * map_cellsize.x
	limit_top = map_limits.position.y * map_cellsize.y
	limit_bottom = map_limits.end.y * map_cellsize.y

func _ready():
	set_camera_limits()
