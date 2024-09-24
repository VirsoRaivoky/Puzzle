extends Node2D

@export var pieces_holder: Node2D 
@export var piece_checker: Node2D
@onready var sele = preload("res://PieceSelector.tscn")


var initial_pieces: Array
var pieces: Array 
var index: int
@export var moves: int 
var max_size: int


var selector_l1
var selector_l2
var selector_r1 
var selector_r2
var init: Array

func _ready():
	initial_pieces = pieces_holder.get_children()
	pieces = initial_pieces
	
	max_size = pieces.size() - 1
	spawn_selectors()
	
func _process(delta):
	
	move_selector()
	inputs()
	change_position()

	if Input.is_action_just_pressed("reset"):
		print("reset")
		pieces = init

func inputs(): 
	if Input.is_action_just_pressed("right"):
		if index > -1 and index < 2 or index > 3 and index < 6:
			index += 1
	
	if Input.is_action_just_pressed("left"):
		if index > 0 and index < 3 or index > 4 and index < 7:
			index += -1
		
		
	if Input.is_action_just_pressed("up") and index > 3:
		index -= 4
		
	if Input.is_action_just_pressed("down") and index < 4:
		index += 4


func move_selector():
	var selectors = get_children()
	
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
		
		var tween = get_tree().create_tween()
		var tween2 = get_tree().create_tween()
		var tween3 = get_tree().create_tween()
		var tween4 = get_tree().create_tween()
		
		var temp_position1 = piece1.position
		var temp_position2 = piece2.position
		var temp_position3 = piece3.position
		var temp_position4 = piece4.position
		
		tween.tween_property(piece1, 'position', temp_position2, 0.1)
		tween2.tween_property(piece2, 'position', temp_position4, 0.1)
		tween3.tween_property(piece3, 'position', temp_position1, 0.1)
		tween4.tween_property(piece4, 'position', temp_position3, 0.1)
		
		pieces[index] = piece3
		pieces[index+1] = piece1 
		pieces[index+4] = piece4
		pieces[index+5]	= piece2
		
		if check_piece(0, 4, 2) and check_piece(4, 8, 0) and check_piece(8, 12, 2):
			print("venceu!!!!")


func spawn_selectors()->void:
	selector_l1 = sele.instantiate()
	selector_l2 = sele.instantiate()
	selector_r1 = sele.instantiate()
	selector_r2 = sele.instantiate()
	
	selector_l1.position = pieces[0].position
	selector_l2.position = pieces[1].position
	selector_r1.position = pieces[4].position
	selector_r2.position = pieces[5].position
	
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

