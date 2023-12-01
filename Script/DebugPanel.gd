extends PanelContainer

@onready var property_container: VBoxContainer = $MarginContainer/VBoxContainer

func _ready() -> void:
	GlobalStats.debug = self
	visible = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("debug"):
		visible = !visible

func add_property(title: String, value , order):
	var target 
	target = property_container.find_child(title,true,false) # Try to find Label node with same Name
	if !target:
		target = Label.new()
		property_container.add_child(target)
		target.name = title
		target.text = target.name + ": " +str(value)
	elif visible:
		target.text = title + ": " +str(value)
		property_container.move_child(target,order)
