extends Node2D

@onready var selector = preload("res://PieceSelector.tscn")
@export var info: Label

var moves: int 
var index: int
var pieces: Array

var selector_l1
var selector_l2
var selector_r1 
var selector_r2

func _ready():
	setup_game()
	
	spawn_selectors()

func _process(_delta)-> void:
	inputs()
	change_position()
	
	info.text = "Movimentos Restantates: " + str(moves)
	
	if moves <= 0:
		await get_tree().create_timer(0.4).timeout
		if check_piece(0, 4, 1) and check_piece(4, 8, 2) and check_piece(8, 12, 0):
			Global.level_screen.level_completed.emit()
		else:
			get_tree().change_scene_to_file("res://Levels/Level1.tscn")


func setup_game():
	
	var current_level = Global.get_level_set()
	moves = Global.level_moves
	pieces = get_children()
	
	for i in range(min(pieces.size(), current_level.size())):
		pieces[i].set_color(current_level[i])


func inputs(): 
	move_selector()
	
	if Input.is_action_just_pressed("right"):
		if index >= 0  and index < 2 or index > 3 and index < 6:
			index += 1
			
	if Input.is_action_just_pressed("left"):
		if index > 0 and index < 3 or index > 4 and index < 7:
			index += -1
			
	if Input.is_action_just_pressed("up") and index > 3:
		index -= 4
		
	if Input.is_action_just_pressed("down") and index < 4:
		index += 4


func move_selector():
	selector_l1.global_position = pieces[index].global_position
	selector_l2.global_position = pieces[index+1].global_position
	selector_r1.global_position = pieces[index+4].global_position
	selector_r2.global_position = pieces[index+5].global_position


func change_position():
	var piece1 = pieces[index]
	var piece2 = pieces[index+1]
	var piece3 = pieces[index+4]
	var piece4 = pieces[index+5]
	
	if Input.is_action_just_pressed("action") and moves > 0:
		
		moves -= 1
		
		var tween = get_tree().create_tween().set_parallel(true)
		
		var temp_position1 = piece1.position
		var temp_position2 = piece2.position
		var temp_position3 = piece3.position
		var temp_position4 = piece4.position
		
		tween.tween_property(piece1, 'position', temp_position2, 0.1)
		tween.tween_property(piece2, 'position', temp_position4, 0.1)
		tween.tween_property(piece3, 'position', temp_position1, 0.1)
		tween.tween_property(piece4, 'position', temp_position3, 0.1)
		
		pieces[index] = piece3
		pieces[index+1] = piece1 
		pieces[index+4] = piece4
		pieces[index+5]	= piece2


func spawn_selectors()->void:
	selector_l1 = selector.instantiate()
	selector_l2 = selector.instantiate()
	selector_r1 = selector.instantiate()
	selector_r2 = selector.instantiate()
	
	selector_l1.position = pieces[0].position
	selector_l1.direction = 0
	selector_l2.position = pieces[1].position
	selector_l2.direction = 3
	selector_r1.position = pieces[4].position
	selector_r1.direction = 2
	selector_r2.position = pieces[5].position
	selector_r2.direction = 1
	
	add_child(selector_l1)
	add_child(selector_l2)
	add_child(selector_r1)
	add_child(selector_r2)


func check_piece(first_piece: int, last_piece: int, required: int) -> bool:
	var row = pieces.slice(first_piece, last_piece)
	for i in row:
		if i.piece_color != required: 
			return false
	return true

