extends Control

@onready var GameInfo = $"../GameInfoNode"
var time = 0
var seconds: int = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	# Create a Label node and add it to the scene tree.		
		# Set the text of the Label node to the current game score.
	var level_timer = $LevelTimer
	var TimeLabel = $UICanvasLayer/LevelTimeLabel
	var CurrentScoreLabel = $UICanvasLayer/CurrentScoreLabel
	
	set_health_label()
	set_health_bar()

	level_timer.wait_time = GameInfo.global_level_time
	level_timer.start()
	
	var level_time_text = "Time: " + str(level_timer.time_left)
	TimeLabel.set_text(level_time_text)
	
	var game_score_text = "Total score: " + str(GameInfo.total_score)
	CurrentScoreLabel.set_text(game_score_text)
	
func set_health_bar():
	$UICanvasLayer/HealthBar.max_value = GameInfo.max_player_health
	$UICanvasLayer/HealthBar.value = GameInfo.player_health
	
func set_health_label():
	$UICanvasLayer/HealthLabel.text = "Health: %s" % GameInfo.player_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var level_timer = $LevelTimer
	var TimeLabel = $UICanvasLayer/LevelTimeLabel
	var level_time = str(floor(level_timer.time_left))
	var level_time_text = "Time: " + level_time
	TimeLabel.set_text(level_time_text)
	

func _on_level_timer_timeout():
	get_tree().change_scene_to_file("res://Game.tscn")
	
func game_over():
	get_tree().change_scene_to_file("res://EndGame.tscn")
