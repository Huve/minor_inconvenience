extends Control

@onready var GameInfo = $"../GameInfoNode"

func countdown_timer(score: float, time: float) -> int:
	# Update the game time.
	score -= time
	if score < 1:
		score = 0
	return int(score)

# Called when the node enters the scene tree for the first time.
func _ready():
	# Create a Label node and add it to the scene tree.
		# Set the text of the Label node to the current game score.
	var level_timer = $LevelTimer
	var TimeLabel = $LevelTimeLabel
	var CurrentScoreLabel = $CurrentScoreLabel
	
	level_timer.wait_time = GameInfo.global_level_time
	level_timer.start()
	
	var level_time_text = "Time: " + str(level_timer.time_left)
	TimeLabel.set_text(level_time_text)
	
	var game_score_text = "Total score: " + str(GameInfo.total_score)
	CurrentScoreLabel.set_text(game_score_text)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
