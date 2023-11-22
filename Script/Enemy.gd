extends Node2D
class_name Enemy

@export var enemy_Data = Resource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.y += enemy_Data.ship_Speed * delta

	if Input.is_action_just_pressed("debug"):
		print("XP Need to Level up " + str(GlobalStats.xp_Need_toUpgrade))
		print("XP Now: " + str(GlobalStats.xp_now))
		print("Added XP: " + str(enemy_Data.xp_Add))
		print("Level: " + str(GlobalStats.level))

func die():
	self.queue_free()
	#print("Wywołałeś Funkcje: die")

func addXP():
	GlobalStats.xp_now += enemy_Data.xp_Add
	checkLevel()

func checkLevel():
	if GlobalStats.xp_now >= GlobalStats.xp_Need_toUpgrade:
		GlobalStats.xp_Need_toUpgrade * GlobalStats.xp_mnoznik
		GlobalStats.level += 1
		GlobalStats.xp_now == 0 

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		die()
		addXP()
		GlobalStats.score += enemy_Data.score_Add
		#print("Bullet Destroyed Me")
		#print("Score: " + str(GlobalStats.score))
	if area.is_in_group("Player"):
		die()
		print("Player Destroyed Me")
