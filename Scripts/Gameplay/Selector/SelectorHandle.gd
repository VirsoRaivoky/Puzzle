extends Node

@onready var selector = preload("res://Entities/Selector/Selector.tscn")
@onready var piece_handler = Global.piece_handler

var actual_index: int
var pieces_list: Array
var is_ready: bool = false
var selector_instance

func _ready():
	spawn_selectors()
	Global.selector_handler = self


func _physics_process(_delta):
	pieces_list = piece_handler.pieces
	actual_index = piece_handler.index
	
	if is_ready:
		selector_instance.global_position = pieces_list[0].global_position
		is_ready = false
		
	if !Global.piece_handler.is_moving:
		move_selector()


func spawn_selectors():
	selector_instance = selector.instantiate()
	add_child(selector_instance)


func move_selector():
	var next_position = pieces_list[actual_index].global_position
	
	var selector_tween = create_tween()
	selector_tween.tween_property(selector_instance, "global_position", next_position, 0.1)
	
	await selector_tween.finished
	if selector_tween.finished:
		selector_tween.kill()


func _on_piece_handler_spawn_selector():
	is_ready = true
