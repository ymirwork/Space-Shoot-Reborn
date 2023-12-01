extends Area2D
class_name Bullet

@export var player_Data: Resource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= player_Data.bullet_Speed * delta



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		self.queue_free()
