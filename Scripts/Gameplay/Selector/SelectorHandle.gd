extends Node

@onready var selector = preload("res://Entities/Selector/Selector.tscn")
@onready var piece_handler = Global.piece_handler

var actual_index: int
var bottom_positions: int

var selectors_list: Array
var pieces_list: Array

var selector_l1
var selector_l2
var selector_r1 
var selector_r2

func _ready():
	spawn_selectors()


func _physics_process(_delta):
	pieces_list = piece_handler.pieces
	actual_index = piece_handler.index
	bottom_positions = piece_handler.right_position
	
	move_selector()


func spawn_selectors():
	selectors_list = [selector_l1, selector_r2, selector_r1, selector_l2]
	for i in selectors_list.size():
		selectors_list[i] = selector.instantiate()
		selectors_list[i].direction = i
		add_child(selectors_list[i])


func move_selector():
	var selectors_position = [pieces_list[actual_index].global_position,
							  pieces_list[actual_index + bottom_positions + 1].global_position, 
							  pieces_list[actual_index + bottom_positions].global_position, 
							  pieces_list[actual_index + 1].global_position]
	
	for i in range(min(selectors_list.size(), selectors_position.size())):
		selectors_list[i].index_position = selectors_position[i] 


func rotate_pieces():
	#TODO: Otimizar essa merda aqui
	#Posição inicial das peças
	var piece1 = pieces_list[actual_index]
	var piece2 = pieces_list[actual_index + 1]
	var piece3 = pieces_list[actual_index + bottom_positions]
	var piece4 = pieces_list[actual_index + bottom_positions + 1]
	
	
	var tween = create_tween().set_parallel(true)
	
	tween.tween_property(piece1, 'position', piece2.position, 0.1)
	tween.tween_property(piece2, 'position', piece4.position, 0.1)
	tween.tween_property(piece3, 'position', piece1.position, 0.1)
	tween.tween_property(piece4, 'position', piece3.position, 0.1)
	
	pieces_list[actual_index] = piece3
	pieces_list[actual_index + 1] = piece1 
	pieces_list[actual_index + bottom_positions] = piece4
	pieces_list[actual_index + bottom_positions + 1] = piece2
	
	await tween.finished
	if tween.finished:
		tween.kill()




