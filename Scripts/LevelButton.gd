extends Button

@export var level_index: int 
@export var set_index: int

func _on_pressed():
	Global.load_level(level_index, set_index)
