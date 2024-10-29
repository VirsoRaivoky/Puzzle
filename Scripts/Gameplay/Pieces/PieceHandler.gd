extends Node2D

@export var rows: int 
@export var limit: int
var right_position: int
var index: int = 0

@export var invalid_positions: Array[int]
var colors_to_match: Array
var pieces: Array

func _ready():
	Global.piece_handler = self
	setup_game()


func _physics_process(_delta):
	inputs()


func setup_game():
	pieces = get_children()
	
	var current_level = Global.get_level_set()
	colors_to_match = Global.match_colors
	
	right_position = pieces.size() / rows
	
	for i in range(min(pieces.size(), current_level.size())):
		pieces[i].set_color(current_level[i])


func inputs(): 
	if Input.is_action_just_pressed("right"):
		check_movement(1)

	if Input.is_action_just_pressed("left"):
		check_movement(-1)

	if Input.is_action_just_pressed("up"):
		check_movement(-right_position)

	if Input.is_action_just_pressed("down"):
		check_movement(right_position)


func check_rows(colors_match: Array) -> bool:
	for r in rows:
		@warning_ignore("integer_division")
		var set_size = pieces.size() / rows
		var initial = set_size * r
		var final = set_size * (r+1)
		var sliced = pieces.slice(initial, final)
		
		for s in sliced:
			if s.piece_color != colors_match[r]:
				return false
	return true


func check_movement(value: int):
	var inv_pos: int = rows - 2
	
	if value > 1 or value < -1:
		if index + value > limit:
			index = index + -value * (rows - 2)
			return
		if index + value < 0:
			index = index + -value * (1 + (rows - 3))
			return
			
	if index + value in invalid_positions or index + value < 0:
		if value > 0:
			index = index - inv_pos 
			return
		index = index + inv_pos
		return
	index += value


