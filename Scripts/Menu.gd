extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_start_pressed():
	get_tree().change_scene_to_file("res://LevelSelect.tscn")
	

func _on_button_2_pressed():
	pass
	#Global.level_index = 2
	#get_tree().change_scene_to_file("res://Levels/Level1.tscn")


func _on_button_3_pressed():
	get_tree().quit()
