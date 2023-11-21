extends CharacterBody2D

@export var MAX_SPEED = 200
@onready var GameInfo = $"../GameInfoNode"
var target_position

func _process(_delta):
	var direction = get_direction_to_player()
	velocity = direction * MAX_SPEED
	move_and_slide()
	
func get_direction_to_player():
	var player_node = GameInfo.player
	if player_node != null:
		return (player_node.global_position - global_position).normalized()
	return Vector2.ZERO
