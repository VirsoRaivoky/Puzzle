extends Node

@onready var row_marker = preload("res://Entities/Marker/Marker.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func spawn_markers():
	
	for r in Global.rows:
		var marker_instance = row_marker.instantiate()
		marker_instance.global_position
		add_child(marker_instance)
