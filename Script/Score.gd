extends CanvasLayer
class_name Score

@onready var score_count: Label = $ScoreCount


func _process(delta: float) -> void:
	score_count.text = str(GlobalStats.score)
