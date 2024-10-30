extends Control

var is_paused: bool = false
@onready var pause_button = $"../PauseButton"
@onready var label = $Label
@onready var next_button = $NextLevel
@onready var continue_button = $Continue

signal level_completed

func _ready():
	Global.pause_screen = self
	next_button.hide()
	connect("level_completed", Callable(self, "_on_level_completed"))
	
	
func _on_level_completed():
	show()
	next_button.show()
	continue_button.hide()
	pause_button.hide()
	label.text = "Finalizado!"


func _on_retry_pressed():
	hide()
	get_tree().change_scene_to_file(Global.get_set())


func _on_next_pressed():
	continue_button.show()
	var next_index = Global.level_index + 1
	Global.load_level(next_index)


func _on_pause_button_pressed():
	is_paused = true
	show()
	pause_button.hide()
	label.text = "Pausado"
	
	
func _on_level_select_pressed():
	get_tree().change_scene_to_file("res://UI/LevelSelect.tscn")


func _on_continue_pressed():
	hide()
	is_paused = false
	pause_button.show()
