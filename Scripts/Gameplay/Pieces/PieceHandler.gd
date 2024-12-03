extends Node2D

signal spawn_selector

@export var rows: int 
@export var limit: int
@export var invalid_positions: Array[int]

var columns: int = 4
var index: int = 0
var swap_mode: int
var right_position: int

var colors_to_match: Array
var pieces: Array
var is_moving: bool = false

@onready var piece_instance = preload("res://Entities/Pieces/Pieces.tscn")

func _ready():
	Global.piece_handler = self
	setup_game()
	index = 1

func _physics_process(_delta):
	inputs()
	


func setup_game():
	
	for r in rows:
		for c in columns:
			var piece = piece_instance.instantiate()
			piece.position = Vector2(c * 120 , r * 120)
			piece.scale = Vector2(0.7, 0.7)
			add_child(piece)
			
			pieces.append(piece)

	var current_level: Array = Global.level_set
	colors_to_match = Global.match_colors
	swap_mode = Global.swap_mode
	
	right_position = pieces.size() / rows
	
	for i in range(min(pieces.size(), current_level.size())):
		pieces[i].set_color(current_level[i])
	
	spawn_selector.emit()


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
			
		
	is_moving = true
	var tween = create_tween().set_parallel(true)
	
	for i in range(min(piece_to_move.size(), pieces_to_swap.size())):
		tween.tween_property(piece_to_move[i], 'global_position', pieces_to_swap[i].global_position, 0.1)
	
	swap_piece_index(pieces_to_swap)

	await tween.finished
	if tween.finished:
		tween.kill()
	is_moving = false


func swap_piece_index(swap_index: Array):
	if swap_mode != 2:
		swap_index.reverse()
	
	pieces[index] = swap_index[0] 
	pieces[index + 1] = swap_index[1] 
	pieces[index + right_position] = swap_index[2]
	pieces[index + right_position + 1] = swap_index[3]


func check_movement(value: int):
	var inv_pos: int = columns - 2
	
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


