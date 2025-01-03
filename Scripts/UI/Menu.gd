extends Control

@onready var background_left: Sprite2D = $MenuLeft
@onready var background_right: Sprite2D = $MenuRight

@onready var menu_itens: Label = $Label

@onready var start: Button = $Start
@onready var quit: Button = $Quit


func _on_start_pressed():
	move_menu_background()
	fade_menu()

func _on_quit_pressed():
	get_tree().quit()

 
func move_menu_background():
	var move_bg = create_tween().set_parallel(true).bind_node(self).set_trans(Tween.TRANS_SINE)
	
	var lp: Vector2 = Vector2(-877, 0) 
	var rp: Vector2 = Vector2(861, 0)
	
	move_bg.tween_property(background_left, "position", lp, 0.7)
	move_bg.tween_property(background_right, "position", rp, 0.7)
	
	await move_bg.finished
	move_bg.kill()
	get_tree().change_scene_to_file("res://UI/LevelSelect.tscn")


func fade_menu():
	
	var fade_tween = create_tween().set_parallel(true).bind_node(self).set_trans(Tween.TRANS_SINE)
	
	fade_tween.tween_property(menu_itens, "modulate:a", 0, 0.5)
	fade_tween.tween_property(start, "modulate:a", 0, 0.5)
	fade_tween.tween_property(quit, "modulate:a", 0, 0.5)
	
	await fade_tween.finished
	fade_tween.kill()
