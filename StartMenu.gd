extends CanvasLayer

@onready var _animation_player = $Control/AnimatedSprite2D/BGAnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_animation_player.play("bg_animation")


func _on_start_game_button_pressed():
	# Start a new game
	get_tree().change_scene_to_file("res://Game.tscn")
