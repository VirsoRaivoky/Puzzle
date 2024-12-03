extends Node

@export var info: Label
var piece_rows: int
var piece_set: Array
var moves_left: int

# Called when the node enters the scene tree for the first time.
func _ready():
	moves_left = Global.level_moves
	piece_set = Global.piece_handler.pieces
	piece_rows = Global.piece_handler.rows

func _process(_delta):
	info.text = str("Restam: ", moves_left)
	
	if Input.is_action_just_pressed("action"):
		moves_left -= 1
	
	if moves_left == 0:
		finish_level()

func finish_level():
	if check_rows(Global.match_colors):
		get_tree().quit()


func check_rows(colors_match: Array) -> bool:
	for r in piece_rows:
		@warning_ignore("integer_division")
		var set_size = piece_set.size() / piece_rows
		var initial = set_size * r
		var final = set_size * (r+1)
		var sliced = piece_set.slice(initial, final)
		
		for s in sliced:
			if s.piece_color != colors_match[r]:
				return false
	return true

