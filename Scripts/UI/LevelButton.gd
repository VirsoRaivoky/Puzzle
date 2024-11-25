extends Button

@export var level_set: Array [int]
@export var match_colors: Array [int]
@export var swap_mode: int = 0
@export var level_moves: int = 0

func _on_pressed():
	Global.level_set = level_set
	Global.match_colors = match_colors
	Global.swap_mode = swap_mode
	Global.level_moves = level_moves
	
	get_tree().change_scene_to_file("res://Levels/Set3x3.tscn")
