extends Node2D

onready var player = $player2
onready var nav2D = $nav2D
onready var line = $Line2D
onready var hud = $HUD_level_select

var ultimo_level_jogado = 1
var cur_level = 1

func _ready():
	
#	if ultimo_level_jogado == null:
#		return
#	player.position = get_node("levels/" + str(ultimo_level_jogado)).position
#
	# carrega a os dados de Levels.txt
	var db = Data.get_data("Levels")
	# atribui o dicionário a variável somente a parte das estrelas
	var stars = db.get("Stars")

	var levels = get_node("levels").get_children()
	# percorre o array de levels e seta as estrelas de cada	
	var i = 1
	for level in levels:
		#level.connect("level_selecionado", level, _atualiza_HUD_level_select(), [name, star])
		# estrelas
		level.star = stars.get("Level" + str(i))
		level.update_stars()
		level.update_complete_level()
		level.update_level() 
		i = i + 1


func _unhandled_input(event):
	if not event is InputEventScreenTouch:
		return
	if event.get_index() != 0 or not event.is_pressed():
		return
	if hud.visible == false:
		var new_path = nav2D.get_simple_path(player.global_position, event.position, false)
		player.path = new_path
		line.points = new_path


func _on_play_pressed():
	get_tree().change_scene("res://_scenes/levels/level" + cur_level + ".tscn")

