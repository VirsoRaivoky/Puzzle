extends Node2D

@export var rows: int 
@export var limit: int
var swap_mode: int
var right_position: int
var index: int = 0

var is_moving: bool = false

@export var invalid_positions: Array[int]
var colors_to_match: Array
var pieces: Array

func _ready():
	Global.piece_handler = self
	swap_mode = 1
	setup_game()


func _physics_process(_delta):
	inputs()
	if check_rows(colors_to_match):
		print("foi")


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
	
	if Input.is_action_just_pressed("action"):
		swap_pieces(swap_mode)


func swap_pieces(mode: int):
	#Posição inicial das peças
	var piece1 = pieces[index]
	var piece2 = pieces[index + 1]
	var piece3 = pieces[index + right_position]
	var piece4 = pieces[index + right_position + 1]
	
	var piece_to_move: Array = [piece1, piece2, piece3, piece4]
	var pieces_to_swap: Array
	
	var clockwise: Array = [piece2, piece4, piece1, piece3]
	var counter_clockwise: Array = [piece3, piece1, piece4, piece2]
	var cross: Array = [piece4, piece3, piece2, piece1]
	
	match mode:
		0:
			pieces_to_swap = clockwise 
		1: 
			pieces_to_swap = counter_clockwise
		2: 
			pieces_to_swap = cross
			
		
	var tween = create_tween().set_parallel(true)
	is_moving = true
	for i in range(min(piece_to_move.size(), pieces_to_swap.size())):
		tween.tween_property(piece_to_move[i], 'global_position', pieces_to_swap[i].global_position, 0.1)
	
	swap_piece_index(pieces_to_swap)

	await tween.finished
	if tween.finished:
		is_moving = false
		tween.kill()


func swap_piece_index(swap_index: Array):
	if swap_mode != 2:
		swap_index.reverse()
	
	pieces[index] = swap_index[0] 
	pieces[index + 1] = swap_index[1] 
	pieces[index + right_position] = swap_index[2]
	pieces[index + right_position + 1] = swap_index[3]
	print(swap_index)


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

