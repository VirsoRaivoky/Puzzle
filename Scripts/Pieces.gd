extends Node2D

var piece_color: int
@onready var color: Sprite2D = $Sprites/Sprite2D

func set_color(color_type):
	
	color.scale = Vector2(0.5,0.5)
	
	match color_type:
		0:
			piece_color = 0
			color.texture = load("res://Sprites/PieceColors/Blue.png")
		1:
			piece_color = 1
			color.texture = load("res://Sprites/PieceColors/Green.png")
		2:
			piece_color = 2
			color.texture = load("res://Sprites/PieceColors/Red.png")
		3:
			piece_color = 3
			color.texture = load("res://Sprites/PieceColors/Orange.png")
		4: 
			piece_color = 4
			color.texture = load("res://Sprites/PieceColors/Turquoise.png")
