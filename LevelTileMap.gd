extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	var level_width = 400
	var level_height = 200
	generate_level(level_width, level_height)


func generate_level(level_width, level_height):
	# Clear existing tiles
	clear()
	
	# Generate ground
	for x in range(level_width):
		for y in range(level_height):
			var floor_tile = Vector2i(1, 2)
			set_cell(0, Vector2i(x, y), 0, floor_tile)
