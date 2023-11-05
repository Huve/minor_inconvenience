extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	var level_width = 400
	var level_height = 200
	generate_level(level_width, level_height)


func generate_level(level_width, level_height):
	# Clear existing tiles
	clear()
	
	var sprite_row = 4
	var left_wall = Vector2i(0, sprite_row)
	var bottom_wall = Vector2i(0, sprite_row)
	var right_wall = Vector2i(0, sprite_row)
	var top_wall = Vector2i(0, sprite_row)
	
	# Generate ground
	for x in range(level_width):
		for y in range(level_height):
			var floor_tile = Vector2i(1, 2)
			set_cell(0, Vector2i(x, y), 0, floor_tile)
			
	# Generate walls (top and sides)
	for x in range(level_width):
		set_cell(0, Vector2i(x, 0), 0, bottom_wall)
		set_cell(0, Vector2i(x, level_height - 1), 0, top_wall)

	for y in range(level_height):
		set_cell(0, Vector2i(0, y), 0, left_wall)
		set_cell(0, Vector2i(level_width - 1, y), 0, right_wall)
