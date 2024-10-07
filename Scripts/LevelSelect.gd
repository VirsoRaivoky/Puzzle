extends Control


func _on_level_1_pressed():
	Global.level_index = 1
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")


func _on_level_2_pressed():
	Global.level_index = 2
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")


func _on_level_3_pressed():
	Global.level_index = 3
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")


func _on_level_4_pressed():
	Global.level_index = 4
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")

func _on_level_5_pressed():
	Global.level_index = 5
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")
