extends Node2D

var player = preload("res://src/entities/player.tscn")

func _ready():
	var novo_player = player.instance()
	add_child(novo_player)
	print_tree_pretty()
	$sprite.visible = false
	


