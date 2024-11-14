extends Node

@onready var selector = preload("res://Entities/Selector/Selector.tscn")
@onready var piece_handler = Global.piece_handler

var actual_index: int

var selectors_list: Array
var pieces_list: Array

var selector_instance

func _ready():
	spawn_selectors()


func _physics_process(_delta):
	pieces_list = piece_handler.pieces
	actual_index = piece_handler.index

	if !Global.piece_handler.is_moving:
		move_selector()


func spawn_selectors():
	selector_instance = selector.instantiate()
	add_child(selector_instance)



func move_selector():
	selector_instance.index_position = pieces_list[actual_index].global_position







