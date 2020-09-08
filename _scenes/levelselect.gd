extends Node2D

onready var player = $player2
onready var nav2D = $nav2D
onready var line = $Line2D


func _ready():
	# carrega a os dados de Levels.txt
	var db = Data.get_data("Levels")
	# atribui o dicionário a variável somente a parte das estrelas
	var stars = db.get("Stars")
	# pega 
	var levels = get_node("levels")
	
	var i = 1
	for child in levels.get_children():
		child.star = stars.get("Level" + str(i))
		i = i + 1
		child.update_stars()
		child.update_complete_level()
		child.update_level() 
		

func _unhandled_input(event):
	if not event is InputEventScreenTouch:
		return
	if event.get_index() != 0 or not event.is_pressed():
		return
		
	var new_path = nav2D.get_simple_path(player.global_position, event.position, false)
	player.path = new_path
	line.points = new_path
	print(new_path)

