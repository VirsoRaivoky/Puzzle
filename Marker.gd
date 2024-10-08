extends Sprite2D

@export var color_type: int

func _ready():
	scale = Vector2(0.1, 0.1)
	set_color(Global.match_colors[color_type])


func set_color(color: int):
	
	match color:
		0:
			texture = load("res://Sprites/PieceColors/Blue.png")
		1:
			texture = load("res://Sprites/PieceColors/Green.png")
		2:
			texture = load("res://Sprites/PieceColors/Red.png")
		3:
			texture = load("res://Sprites/PieceColors/Orange.png")
		4: 
			texture = load("res://Sprites/PieceColors/Turquoise.png")
