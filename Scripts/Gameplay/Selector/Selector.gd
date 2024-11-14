extends Node2D

@onready var indicator: Sprite2D = $Arrow
var index_position: Vector2
var direction: int = 0
var location: int

func _ready():
	#var tween = get_tree().create_tween()
	#animation_loop(tween)
	switch_indicator()


func _process(_delta):
	selector_position(index_position)
	scale = Vector2 (0.7,0.7)


func selector_position(pos: Vector2):
	position = pos


func switch_indicator():
	if direction == 0:
		return
		
	elif direction == 3:
		indicator.rotate(90)
		indicator.position.x = 66
		indicator.position.y = -50
		
	elif direction == 1:
		indicator.position.x = 61
		indicator.position.y = 55
		indicator.flip_h = true
		indicator.flip_v = true
		
	elif direction == 2:
		indicator.position.x = -40
		indicator.position.y = 61
		indicator.rotate(-90)


#func animation_loop(tween):
#	tween.tween_property(indicator, "modulate", Color(1, 1, 1, 0.2), 0.5)
#	tween.tween_property(indicator, "modulate", Color(1, 1, 1, 0.6), 0.5)
	
#	tween.connect("finished", Callable(self, "_on_tween_finished"))



func _on_tween_finished():
	var tween = get_tree().create_tween()
	#animation_loop(tween)

