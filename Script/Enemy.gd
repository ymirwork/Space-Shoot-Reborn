extends Node2D
class_name Enemy

@export var enemy_Data = Resource
@export var player_Data = Resource
@export var health_enemy: int = 10
@onready var health_enemy_ProgressBar: ProgressBar = $Health_Enemy


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health_enemy_ProgressBar.max_value = health_enemy
	health_enemy_ProgressBar.value = health_enemy
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.y += enemy_Data.ship_Speed * delta

func die():
	if health_enemy == 0.0:
		self.queue_free()
	#print("Wywołałeś Funkcje: die")

func apply_damage(damage_amount: float):
	health_enemy = clamp(health_enemy - damage_amount, 0.0, 100.0)
	health_enemy_ProgressBar.value = health_enemy
	die()

func _on_area_entered(area: Area2D) -> void:
	var new_player = Player.new()
	if area.is_in_group("Bullet"):
		GlobalStats.score += enemy_Data.score_Add
		apply_damage(player_Data.damage)
		new_player.gain_experience(enemy_Data.xp_Add)
		#print("Health Enemy: " + str(health_enemy))
	if area.is_in_group("Player"):
		die()
		print("Player Destroyed Me")
