extends CharacterBody2D

@onready var _animation_player = $PlayerAnimationPlayer
@onready var GameInfo = $"../GameInfoNode"
@onready var GameControl = $"../GameControlNode"

const SPEED = 500.0

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


func handle_collision():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()

		
func _physics_process(_delta):
	# Get the player's input.
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	# Normalize the input vector. This ensures that the character moves at the same speed in all directions.
	input = input.normalized()

	# Set the character's velocity based on the input.
	velocity = input * SPEED
	
	# Move the character.
	var _collision = move_and_slide()
	handle_collision()


func _on_player_hit_box_area_entered(area):
	if area.name == "HitBox":
		var parent = area.get_parent()
		GameInfo.player_health = max(GameInfo.player_health - parent.damage, 0)
		GameControl.set_health_bar()
		GameControl.set_health_label()
		# If player runs out of health, end the game
		if GameInfo.player_health <= 0:
			GameControl.game_over()
