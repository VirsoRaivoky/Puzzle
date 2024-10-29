extends Node

@onready var selector_handler = preload("res://Entities/Selector/SelectorHandler.tscn")
@export var info: Label

var moves_left: int


# Called when the node enters the scene tree for the first time.
func _ready():
	moves_left = Global.level_moves
	
	var selec_handler = selector_handler.instantiate()
	add_child(selec_handler)


func _process(delta):
	info.text = str("Restam: ", moves_left)



func finish_level():
	pass


