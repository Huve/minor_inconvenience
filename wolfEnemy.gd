extends CharacterBody2D

@export var speed = 200
var player_position
var target_position

@onready var _animation_enemy = $WolfAnimationPlayer
@onready var player = get_parent().get_node("PlayerCharacterBody2D")

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		_animation_enemy.play("walkRight")
	elif Input.is_action_pressed("ui_left"):
		_animation_enemy.play("walkLeft")
	elif Input.is_action_pressed("ui_up"):
		_animation_enemy.play("walkUp")
	elif Input.is_action_pressed("ui_down"):
		_animation_enemy.play("walkDown")
	else:
		_animation_enemy.stop()
		
func _physics_process(_delta):
	player_position = player.position
	target_position = (player_position - position).normalized()

	if position.distance_to(player_position) > 3:
		look_at(player_position)
		velocity = target_position * speed
		move_and_slide()
		
