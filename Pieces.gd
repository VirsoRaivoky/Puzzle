extends Node2D
class_name Pieces

@export_enum("Blue", "Green", "Red") var piece_color: int
@onready var color_red: Sprite2D = $Sprites/Red
@onready var color_blue: Sprite2D = $Sprites/Blue

var board_position: int 
var is_selected: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	if piece_color == 2:
		color_red.visible = true
		color_blue.visible = false
	if piece_color == 0:
		color_red.visible = false
		color_blue.visible = true


