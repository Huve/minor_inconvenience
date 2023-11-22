extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill", sb)
	sb.bg_color = Color(225, 0, 0, .5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func updateHealth():
	pass
