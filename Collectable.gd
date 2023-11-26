extends Area2D

func collect():
	queue_free()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func spawn_item():
	# spawn the collectable.
	pass
	#var enemy_scene = load(enemy_list[0]) 
	#var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	#var spawn_position = player.global_position + (random_direction * SPAWN_RADIUS)
	#var enemy = enemy_scene.instantiate() as Node2D
	#get_parent().add_child(enemy)
	#enemy.global_position = spawn_position
	
	
