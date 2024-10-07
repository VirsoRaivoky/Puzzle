extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_start_pressed():
	get_tree().change_scene_to_file("res://UI/LevelSelect.tscn")
	

func _on_button_2_pressed():
	pass


func _on_button_3_pressed():
	get_tree().quit()
