extends Node2D

@onready var indicator: Sprite2D = $Sprite2D/Indicator 
var index_position: Vector2
var direction: int = 0

func _ready():
	var tween = get_tree().create_tween()
	animation_loop(tween)
	switch_indicator()


func _process(_delta):
	selector_position(index_position)
	scale = Global.piece_handler.pieces[0].scale

func selector_position(pos: Vector2):
	position = pos
	
	
func switch_indicator():
	
	if direction == 0:
		return
	elif direction == 1:
		indicator.flip_h = true
	elif direction == 2:
		indicator.rotate(80)
	elif direction == 3:
		indicator.rotate(-80)
	
	
func animation_loop(tween):

	tween.tween_property($Sprite2D, "modulate", Color(1, 1, 1, 0.2), 0.5)
	tween.tween_property($Sprite2D, "modulate", Color(1, 1, 1, 0.6), 0.5)
	
	tween.connect("finished", Callable(self, "_on_tween_finished"))


func _on_tween_finished():
	var tween = get_tree().create_tween()
	animation_loop(tween)

