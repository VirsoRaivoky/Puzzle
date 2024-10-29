extends Button

@export var level_index: int

func _on_pressed():
	Global.load_level(level_index)
