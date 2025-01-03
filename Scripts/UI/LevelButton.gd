extends Button

@export var rows: int
@export var columns: int
@export var swap_mode: int = 0
@export var level_moves: int = 0
@export var level_set: Array [int]
@export var match_colors: Array [int]
@export var x_cord: float
@export var y_cord: float

func _on_pressed():
	Global.rows = rows
	Global.columns = columns
	Global.level_set = level_set
	Global.swap_mode = swap_mode
	Global.match_colors = match_colors
	Global.level_moves = level_moves
	Global.start_position = Vector2(215.5 + (120 * x_cord), 75.5 + (120 * y_cord))
	
	get_tree().change_scene_to_file("res://Levels/Set3x3.tscn")
