extends Node

var piece_handler
var selector_handler
var pause_screen

var level_moves: int
var level_index: int = 1
var set_index: int = 0
var match_colors: Array

var level1_1: Array = [0, 0, 1,
					   1, 1, 2, 
					   2, 0, 2]
					
var level1_2: Array = [2, 2, 4,
					   2, 3, 3, 
					   4, 3, 4]
					
var level1_3: Array = [0, 0, 4,
					   0, 1, 4, 
					   4, 1, 1]
					
var level1_4: Array = [2, 2, 1,
					   1, 2, 3, 
					   1, 3, 3]
					
var level1_5: Array = [3, 3, 0,
					   4, 4, 0, 
					   3, 4, 0]


var level2_1: Array = [0, 1, 0, 0,
					   0, 1, 3, 1,
					   2, 1, 2, 2,
					   3, 2, 3, 3]
					

var level2_2: Array = [4, 0, 4, 4,
					   0, 0, 0, 3,
					   4, 3, 1, 3,
					   1, 3, 1, 1]

var level2_3: Array = [1, 2, 3, 1,
					   1, 1, 3, 3,
					   3, 0, 2, 2,
					   2, 0, 0, 0]

var level2_4: Array = [2, 4, 2, 2,
					   4, 4, 4, 3,
					   2, 3, 3, 1,
					   1, 3, 1, 1]

var level2_5: Array = [3, 3, 3, 0,
					   3, 2, 4, 2,
					   0, 2, 2, 0,
					   4, 0, 4, 4]


var level3_1: Array =  [0, 0, 0, 0, 1,
					   1, 1, 1, 0, 1,
					   2, 2, 3, 2, 2,
					   3, 2, 3, 4, 3, 
					   4, 4, 3, 4, 4]

var level3_2: Array = [5, 3, 5, 5, 5,
					   5, 3, 3, 6, 3,
					   1, 1, 3, 1, 1, 
					   6, 4, 1, 6, 6, 
					   6, 4, 4, 4, 4]

var level3_3: Array = [2, 2, 2, 2, 1,
					   1, 4, 2, 4, 1,
					   1, 4, 4, 0, 4,
					   0, 0, 1, 5, 0,  
					   5, 0, 5, 5, 5]

var level3_4: Array = [4, 0, 0, 4, 4,
					   4, 0, 3, 0, 3,
					   3, 4, 3, 0, 5,
					   5, 3, 1, 5, 5,  
					   1, 5, 1, 1, 1]

var level3_5: Array = [6, 2, 6, 6, 4,
					   6, 2, 6, 2, 2,
					   4, 1, 2, 4, 4, 
					   1, 3, 1, 3, 1, 
					   4, 3, 1, 3, 3]


func load_level(level_i: int):
	level_index = level_i
	get_level_set()
	get_tree().change_scene_to_file(get_set())


func get_level_set():
	
	match level_index:
		1:
			level_moves = 2
			match_colors = [0, 1, 2]
			set_index = 0
			return level1_1
		2:
			level_moves = 3
			match_colors = [2, 3, 4]
			set_index = 0
			return level1_2
		3: 
			level_moves = 4
			match_colors = [0, 1, 4]
			set_index = 0
			return level1_3
		4:
			level_moves = 4
			match_colors = [1, 2, 3]
			set_index = 0
			return level1_4
		5:
			level_moves = 5
			match_colors = [3, 4, 0]
			set_index = 0
			return level1_5
		6:
			level_moves = 3
			match_colors = [0, 1, 2, 3]
			set_index = 1
			return level2_1
		7:
			level_moves = 4
			match_colors = [4, 0, 3, 1]
			set_index = 1
			return level2_2
		8:
			level_moves = 5
			match_colors = [1, 3, 2, 0]
			set_index = 1
			return level2_3
		9:
			level_moves = 5
			match_colors = [2, 4, 3, 1]
			set_index = 1
			return level2_4
		10:
			level_moves = 6
			match_colors = [3, 2, 0, 4]
			set_index = 1
			return level2_5
		11:
			level_moves = 3
			match_colors = [0, 1, 2, 3, 4]
			set_index = 2
			return level3_1
		12:
			level_moves = 4
			match_colors = [5, 3, 1, 6, 4]
			set_index = 2
			return level3_2
		13:
			level_moves = 5
			match_colors = [2, 1, 4, 0, 5]
			set_index = 2
			return level3_3
		14:
			level_moves = 6
			match_colors = [4, 0, 3, 5, 1]
			set_index = 2
			return level3_4
		15:
			level_moves = 7
			match_colors = [6, 2, 4, 1, 3]
			set_index = 2
			return level3_5

func get_set():
	match set_index: 
		0: 
			return "res://Levels/Set3x3.tscn"
		1: 
			return "res://Levels/Set4x4.tscn"
		2: 
			return "res://Levels/Set5x5.tscn"
			

