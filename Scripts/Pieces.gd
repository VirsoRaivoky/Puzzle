extends Node2D
class_name Pieces

@export_enum("Blue", "Green", "Red") var piece_color: int
@onready var color: Sprite2D = $Sprites/Sprite2D

func set_color(color_type):
	
	color.scale = Vector2(0.5,0.5)
	
	match color_type:
		0:
			color_type = 0
			piece_color = 0
			color.texture = load("res://Sprites/Blue.png")
		1:
			color_type = 1
			piece_color = 1
			color.texture = load("res://Sprites/Green.png")
		2:
			color_type = 2
			piece_color = 2
			color.texture = load("res://Sprites/Red.png")
