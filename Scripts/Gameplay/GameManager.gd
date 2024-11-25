extends Node

@export var info: Label

var moves_left: int

# Called when the node enters the scene tree for the first time.
func _ready():
	moves_left = Global.level_moves
	


func _process(_delta):
	info.text = str("Restam: ", moves_left)



func finish_level():
	pass



