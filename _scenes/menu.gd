extends Node2D


func _ready():
	pass


func _on_Play_button_pressed():
	get_tree().change_scene("res://_scenes/levels/level1.tscn")
