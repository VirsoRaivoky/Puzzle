extends Button

@export var level_index: int 
@export var set_index: int
@export var level_moves: int
@export var piece_colors: Array[int]

func load_level(level_index: int, set_i: int, level_set: Array, moves: int):
	Global.level_index = level_index
	Global.set_index = set_index
	Global.level_set = level_set
	Global.level_moves = moves
	get_tree().change_scene_to_file(Global.get_level())


func _on_pressed():
	load_level(level_index, set_index, piece_colors, level_moves)
