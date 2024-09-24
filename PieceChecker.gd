extends Node2D

@export var pieces: Node2D

@export var required: int
@export var first_piece: int
@export var last_piece: int
var piece_set: Array

func check(row: Array) -> bool:
	
	var require_value = required
	for i in row:
		if i.piece_color != require_value: return false
	return true

