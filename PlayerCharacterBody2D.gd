extends CharacterBody2D

@onready var _animation_player = $PlayerAnimationPlayer
@onready var GameInfo = $"../GameInfoNode"
@onready var GameControl = $"../GameControlNode"
@onready var hurtBox = $PlayerHitBox
const SPEED = 500.0

var facing = "right"


func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		if facing == "left":
			$Sprite2D.scale.x = 1
			facing = "right"
		_animation_player.play("player_movement_right")
	elif Input.is_action_pressed("ui_left"):
		if facing == "right":
			$Sprite2D.scale.x = -1
			facing = "left"
		_animation_player.play("player_movement_right")
	elif Input.is_action_pressed("ui_up"):
		_animation_player.play("player_movement_right")
	elif Input.is_action_pressed("ui_down"):
		_animation_player.play("player_movement_right")
	else:
		pass

		
func _physics_process(_delta):
	# Get the player's input.
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	# Normalize the input vector. This ensures that the character moves at the same speed in all directions.
	input = input.normalized()

	# Set the character's velocity based on the input.
	velocity = input * SPEED
	if velocity.x == 0 and velocity.y == 0:
		_animation_player.play("player_idle_right")
	
	# Move the character.
	var _collision = move_and_slide()


func _on_player_hit_box_area_entered(area):
	# Handle what happens when something enters the player hitbox.
	
	# If an object with a hitbox enters the player hitbox, take damage.
	if area.name == "HitBox":
		var parent = area.get_parent()
		GameInfo.player_health = max(GameInfo.player_health - parent.damage, 0)
		GameControl.set_health_bar()
		GameControl.set_health_label()
		# If player runs out of health, end the game
		if GameInfo.player_health <= 0:
			GameControl.game_over()
	if area.has_method('collect'):
		# TODO: collec item
		print(area.name)
		area.collect()
