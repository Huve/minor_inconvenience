extends CharacterBody2D

@export var MAX_SPEED = 200
@onready var GameInfo = $"../GameInfoNode"
@onready var _animation_player = $AnimationPlayer
@onready var item_dropped = false
var target_position
var damage = 1


func _process(_delta):
	var direction = get_direction_to_player()
	velocity = direction * MAX_SPEED
	_animation_player.play('karen_run_right')
	if item_dropped == false:
		drop_item()
		item_dropped = true
	move_and_slide()
	
	
func get_direction_to_player():
	var player_node = GameInfo.player
	if player_node != null:
		return (player_node.global_position - global_position).normalized()
	return Vector2.ZERO
	
	
func drop_item():
	var dropped_item = load("res://collectables/wicked_cucumber.tscn") 
	# set its position to where the enemy is
	var item = dropped_item.instantiate()
	get_parent().add_child(item)
	item.global_position = global_position
	item.start_animations()
