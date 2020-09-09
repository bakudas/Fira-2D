extends Node2D


func _ready():
	# carrega a os dados de Levels.txt
	var db = Data.get_data("Levels")
