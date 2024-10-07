extends Node

var piece_handler
var level_screen
var level_moves: int
var level_index: int = 1
var set_index: int = 0

var level_set: Array
var level1: Array = [1, 2, 1 ,0 , 1, 2, 1, 2, 0, 0, 2, 0]
var level2: Array = [1, 2, 1, 2, 1, 2, 0, 0, 0, 2, 1, 0]
var level3: Array = [1, 1, 1, 2, 2, 2, 0, 2, 1, 0, 0, 0]
var level4: Array = [1, 1, 2, 0, 1, 1, 2, 2, 0, 2, 0, 0]
var level5: Array = [2, 2, 2, 0, 1, 1, 1, 0, 0, 2, 1, 0]

var level1_2: Array = [1, 2, 1, 0, 1, 2, 1, 2, 0, 0, 2, 0, 1, 0, 2, 1, 2, 1, 0, 1]

func get_level_set():
	
	match level_index:
		1:
			level_moves = 3
			return level1
		2:
			level_moves = 4
			return level2
		3: 
			level_moves = 5
			return level3
		4:
			level_moves = 5
			return level4
		5:
			level_moves = 6
			return level5
		6:
			level_moves = 10
			return level1_2


func get_level():
	match set_index: 
		0: 
			return "res://Levels/Level1.tscn"
		1: 
			return "res://Levels/Set5x5.tscn"
			

