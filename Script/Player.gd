extends Node2D
class_name Player
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var dead_screen: CanvasLayer = $"../UI/Dead Screen"
@onready var health_progress_bar: TextureProgressBar = $"../UI/Health/health_Progress_Bar"
@onready var score_canvas_layer: CanvasLayer = $"../UI/Score"

@export_category("Player")
@export var player_Data: Resource
@export var bullet_Scane: PackedScene
@export_category("Level")
@export var level: int = 1
@export var experience: int = 0 
@export var experience_total: int = 0 
var experience_required = get_required_experience(level + 1)

func _ready() -> void:
	health_progress_bar.max_value = player_Data.health_Player
	health_progress_bar.value = player_Data.health_Player
	
	

func _physics_process(delta: float) -> void:
	var mouse_x = get_global_mouse_position().x
	var mouse_y = get_global_mouse_position().y
	position.x = mouse_x
	position.y = mouse_y
	animation_player.play("fly")
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_HIDDEN)
	
	if Input.is_action_just_pressed("fire"):
		shoot()

func shoot():
	var bullet_new = bullet_Scane.instantiate()
	bullet_new.position = self.position
	add_sibling(bullet_new)
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		area.queue_free()
#		print("Area entered to: Enemy")
		player_Data.health_Player -= 1
		health_progress_bar.value = player_Data.health_Player
		print("Zderzenie straciłeś Życie!")
		if player_Data.health_Player <= 0:
			DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
			dead_screen.show()
			score_canvas_layer.hide()
			health_progress_bar.hide()
			print("Dead")
			queue_free()
func get_required_experience(level):
	return round(pow(level, 1.8) + level * 4)
func gain_experience(amount_xp):
	experience_total += amount_xp
	experience += amount_xp
	while experience >= experience_required:
		experience -= experience_required
		level_up()
		print("Experience: " + str(experience))
		print("Level: " + str(level))
func level_up():
	level += 1
	experience_required = get_required_experience(level + 1)
	print("Level up: " + str(level))
