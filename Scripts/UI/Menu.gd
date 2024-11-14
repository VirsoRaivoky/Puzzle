extends Control

@onready var background_left: Sprite2D = $MenuLeft
@onready var background_right: Sprite2D = $MenuRight

@onready var left_post: Node2D = $LeftPos
@onready var right_post: Node2D = $RightPost

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_start_pressed():
	#get_tree().change_scene_to_file("res://UI/LevelSelect.tscn")
	move_menu_background()
	

func move_menu_background():
	var move_bg = create_tween().set_parallel(true)
	
	var lp: Vector2 = Vector2(-856, 0) 
	var rp: Vector2 = Vector2(861, 0)
	
	move_bg.tween_property(background_left, "position", lp, 0.7)
	move_bg.tween_property(background_right, "position", rp, 0.7)
	
func _on_button_2_pressed():
	pass


func _on_button_3_pressed():
	get_tree().quit()
