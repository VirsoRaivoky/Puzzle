extends Node2D

@export var color_type: int
var marker_color: Sprite2D 

func _ready():
	marker_color = get_node("MarkerColor")
	marker_color.scale = Vector2(0.25, 0.4)
	set_color(Global.match_colors[color_type])


func set_color(color: int):
	
	match color:
		0:
			marker_color.texture = load("res://Sprites/PieceColors/Blue.png")
		1:
			marker_color.texture = load("res://Sprites/PieceColors/Green.png")
		2:
			marker_color.texture = load("res://Sprites/PieceColors/Red.png")
		3:
			marker_color.texture = load("res://Sprites/PieceColors/Orange.png")
		4: 
			marker_color.texture = load("res://Sprites/PieceColors/Turquoise.png")
		5: 
			marker_color.texture = load("res://Sprites/PieceColors/Purple.png")
		6:
			marker_color.texture = load("res://Sprites/PieceColors/White.png")
		_:
			return
