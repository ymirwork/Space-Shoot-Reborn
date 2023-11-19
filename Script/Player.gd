extends Node2D
class_name Player
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var health_Player: int = 5
@export var bullet_Scane: PackedScene
@onready var dead_screen: CanvasLayer = $"../UI/Dead Screen"
@onready var health_progress_bar: TextureProgressBar = $"../UI/Health/health_Progress_Bar"


func _ready() -> void:
	health_progress_bar.max_value = health_Player
	health_progress_bar.value = health_Player


func _process(_delta: float) -> void:
	var mouse_x = get_global_mouse_position().x
	var mouse_y = get_global_mouse_position().y
	position.x = mouse_x
	position.y = mouse_y
	animation_player.play("fly")
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_HIDDEN)
	
	if Input.is_action_just_pressed("fire"):
		var bullet_new = bullet_Scane.instantiate()
		bullet_new.position = self.position
		add_sibling(bullet_new)
		

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		area.queue_free()
#		print("Area entered to: Enemy")
		health_Player -= 1
		health_progress_bar.value = health_Player
		print("Zderzenie straciłeś Życie!")
		if health_Player <= 0:
			DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
			dead_screen.show()
			print("Dead")
			queue_free()
		
	
