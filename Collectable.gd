extends Area2D

@onready var _animation_player = $AnimationPlayer

func collect():
	queue_free()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func spawn_item():
	# spawn the collectable.
	pass


func start_animations():
	_animation_player.play('item_float')

	
	
