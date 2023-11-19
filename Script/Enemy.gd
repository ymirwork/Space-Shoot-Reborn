extends Node2D
class_name Enemy

@export var enemy_Data = Resource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.y += enemy_Data.ship_Speed * delta

func die():
	self.queue_free()
	print("Wywołałeś Funkcje: die")
	
func testPrint():
	print("Wywołałeś Funkcje: TestPrint")

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		die()
		GlobalStats.score += enemy_Data.score_Add
		print("Bullet Destroyed Me")
		print("Score: " + str(GlobalStats.score))
	if area.is_in_group("Player"):
		die()
		print("Player Destroyed Me")
