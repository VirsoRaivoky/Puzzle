extends Control

signal level_completed
signal level_retry
@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level_screen = self
	hide()
	connect("level_completed", Callable(self, "_on_level_completed"))
	
	
func _on_level_completed():
	show()
	label.text = "Finalizado!"
	

func on_level_retry():
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")


func _on_retry_pressed():
	hide()
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")


func _on_next_pressed():
	hide()
	var actual_index = Global.level_index
	Global.level_index = actual_index + 1
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")
