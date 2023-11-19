extends Node2D
class_name World

func _on_button_pressed_restart_game() -> void:
	print("Button Pressed... Restarting game")
	get_tree().reload_current_scene()
	
