extends Node

@onready var selector = preload("res://Entities/Selector/Selector.tscn")
@onready var piece_handler = Global.piece_handler

var actual_index: int
var pieces_list: Array
var is_ready: bool = false
var selector_instance

func _ready():
	spawn_selectors()
	Global.selector_handler = self


func _physics_process(_delta):
	pieces_list = piece_handler.pieces
	actual_index = piece_handler.index

	if !Global.piece_handler.is_moving and !Global.piece_handler.is_restarting:
		move_selector()
	
	if Global.piece_handler.is_restarting:
		selector_instance.global_position = pieces_list[0].global_position
		
func spawn_selectors():
	selector_instance = selector.instantiate()
	add_child(selector_instance)


func move_selector():
	if actual_index >= 0 and actual_index < pieces_list.size():  # Verificar se o índice está dentro do alcance
		var piece = pieces_list[actual_index]
		if is_instance_valid(piece) and piece != null:  # Verifica se o objeto é válido e não nulo
			var next_position = piece.global_position
			
			var selector_tween = create_tween()
			selector_tween.tween_property(selector_instance, "global_position", next_position, 0.1)
			await selector_tween.finished
			if selector_tween.is_valid():  # Certifica-se de que o tween ainda existe antes de tentar matá-lo
				selector_tween.kill()
		else:
			print("O objeto na lista foi removido ou não é válido.")
	else:
		print("Índice fora do alcance da lista.")


