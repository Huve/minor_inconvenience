extends CharacterBody2D

@onready var _animation_player = $PlayerAnimationPlayer

const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		_animation_player.play("player_movement_2")
	elif Input.is_action_pressed("ui_left"):
		_animation_player.play("player_movement_2")
	elif Input.is_action_pressed("ui_up"):
		_animation_player.play("player_movement_3")
	elif Input.is_action_pressed("ui_down"):
		_animation_player.play("player_movement_1")
	else:
		_animation_player.stop()

func _physics_process(delta):
	
	# Get the player's input.
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	# Normalize the input vector. This ensures that the character moves at the same speed in all directions.
	input = input.normalized()

	# Set the character's velocity based on the input.
	velocity = input * SPEED
	
	# Move the character.
	var _collision = move_and_slide()
	#move_and_collide(velocity * delta)
	#if _collision:
	#	print("I collided with ", _collision.get_collider().name)
