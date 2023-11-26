extends Node2D

var SPAWN_RADIUS = 300.0
var spawn_interval = 1.0
var spawn_timer
@onready var player = $"../PlayerCharacterBody2D"
@onready var enemy_list = ["res://enemies/enemy_karen.tscn"]

func _ready():
	# Set up the timer to spawn enemies at regular intervals
	set_process(true)
	spawn_timer = Timer.new()
	spawn_timer.wait_time = spawn_interval
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	add_child(spawn_timer)
	spawn_timer.start()
	
func spawnEnemy():
	# Load the appropriate enemy from the list and spawn them in the scene 
	# in a radius around the player
	var enemy_scene = load(enemy_list[0]) 
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var spawn_position = player.global_position + (random_direction * SPAWN_RADIUS)
	var enemy = enemy_scene.instantiate() as Node2D
	get_parent().add_child(enemy)
	enemy.global_position = spawn_position
	
func _on_spawn_timer_timeout():
	# Spawn an enemy when the timer runs out.
	spawnEnemy()
