extends Node2D

@export var enemy_Scane: Array[PackedScene] = []

func _on_timer_timeout() -> void:
	var enemy = enemy_Scane.pick_random().instantiate()
	self.add_child(enemy)
	var viewport_x = get_viewport_rect().size.x
	var random_x = randi_range(0, viewport_x - 10)
	enemy.position.x = random_x
	enemy.position.y = -40
#	print("Enemy Spawned at: " + enemy.position.x + enemy.position.y)



func _on_area_2d_area_entered(area: Area2D) -> void:
	area.queue_free()
