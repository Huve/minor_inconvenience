extends Node

var player_level = 0
var player_strength = 1
var player_speed = 1
var player_health = 1

var level_count = 1
var default_total_score = 0
var total_score = 0
var current_level_score = 0
var global_level_time = 10

@onready var player = $"../PlayerCharacterBody2D"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
