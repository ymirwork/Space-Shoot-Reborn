extends Area2D
class_name Bullet


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= GlobalStats.speed_Bullet * delta



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		self.queue_free()
