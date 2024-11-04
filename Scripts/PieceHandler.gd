extends Node2D

@onready var selector = preload("res://Entities/Selector/Selector.tscn")
@export var info: Label

@export var rows: int 
var right_position: int
var moves: int 
var index: int = 0

@export var invalid_positions: Array[int]
var colors_to_match: Array
var pieces: Array
var selectors_list: Array

var selector_l1
var selector_l2
var selector_r1 
var selector_r2

func _ready():
	Global.piece_handler = self
	selectors_list = [selector_l1, selector_r2, selector_r1, selector_l2]
	setup_game()


func _process(_delta)-> void:
	inputs()
	
	info.text = " Movimentos:  " + str(moves)
	
	if moves <= 0:
		await get_tree().create_timer(0.4).timeout
		if check_piece(colors_to_match):
			Global.pause_screen.level_completed.emit()
		else:
			for i in range(pieces.size()):
				pieces[i].set_color(Global.get_level_set()[i])
			moves = Global.level_moves



func setup_game():
	
	var current_level = Global.get_level_set()
	colors_to_match = Global.match_colors
	moves = Global.level_moves
	
	pieces = get_children()
	@warning_ignore("integer_division")
	right_position = pieces.size() / rows
	
	for i in range(min(pieces.size(), current_level.size())):
		pieces[i].set_color(current_level[i])
	
	spawn_selectors()


func inputs(): 
	move_selector()
	
	if Input.is_action_just_pressed("right"):
		if check_movement(index + 1):
			index += 1

	if Input.is_action_just_pressed("left"):
		if check_movement(index - 1):
			index -= 1
			
	if Input.is_action_just_pressed("up"):
		if check_movement(index - right_position):
			index -= right_position
		
	if Input.is_action_just_pressed("down"):
		if check_movement(index + right_position):
			index += right_position
	
	if Input.is_action_just_pressed("action"):
		change_position()


func move_selector():
	var selectors_position = [pieces[index].position,
							  pieces[index + right_position + 1].position, 
							  pieces[index + right_position].position, 
							  pieces[index + 1].position]
	
	for i in range(min(selectors_list.size(), selectors_position.size())):
		selectors_list[i].index_position = selectors_position[i] 


func change_position():
	#TODO: Otimizar essa merda aqui
	var piece1 = pieces[index]
	var piece2 = pieces[index+ 1]
	var piece3 = pieces[index+ right_position]
	var piece4 = pieces[index+ right_position + 1]
	
	if moves > 0:
		moves -= 1
		
		var tween = create_tween().set_parallel(true)
		
		var temp_position1 = piece1.position
		var temp_position2 = piece2.position
		var temp_position3 = piece3.position
		var temp_position4 = piece4.position
		
		tween.tween_property(piece1, 'position', temp_position2, 0.1)
		tween.tween_property(piece2, 'position', temp_position4, 0.1)
		tween.tween_property(piece3, 'position', temp_position1, 0.1)
		tween.tween_property(piece4, 'position', temp_position3, 0.1)
		
		
		pieces[index] = piece3
		pieces[index + 1] = piece1 
		pieces[index + right_position] = piece4
		pieces[index + right_position + 1] = piece2
		
		await tween.finished
		if tween.finished:
			tween.kill()
		
		
func spawn_selectors():
	for i in selectors_list.size():
		selectors_list[i] = selector.instantiate()
		selectors_list[i].direction = i
		add_child(selectors_list[i])


func check_movement(value: int)-> bool:
	var total_size: int  = pieces.size()
	@warning_ignore("integer_division")
	var move_limit: int = (total_size / rows) * (rows - 1) - 1
	@warning_ignore("integer_division")
	#var invalid_position: int = (total_size / rows) - 1
	
	if value < 0 or value in invalid_positions:
		return false
	return value < move_limit


func check_piece(colors_match: Array) -> bool:
	
	for r in rows:
		@warning_ignore("integer_division")
		var m = pieces.size() / rows
		var initial = m * r
		var final = m * (r+1)
		var sliced = pieces.slice(initial, final)
		
		for s in sliced:
			if s.piece_color != colors_match[r]:
				return false
	return true
			
