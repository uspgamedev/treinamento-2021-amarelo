extends Node

func _ready():
	var enemyscene = load("res://src/scenes/Inimigo.tscn")
	
	var screen_size = get.viewport().get_visible_rect().size
	
	for i in range (0,10)
