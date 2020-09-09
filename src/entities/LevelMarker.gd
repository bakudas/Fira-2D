extends Node2D

export(String, "0", "1", "2", "3") var star:String = "3"
export(bool) var completo:bool = false

onready var levelselect = get_node("../../.")
onready var hud = get_node("../../HUD_level_select")
onready var stars_hud = get_node("../../HUD_level_select/stars")

func _ready():
	if completo:
		$marker.play("completo")
		
	$stars.play(star)
	
	
func update_stars() -> void:
	$stars.play(star)


func update_complete_level() -> void:
	if star == "3":
		completo = true
		$marker.play("completo")
		

func update_level() -> void:
	if star == "3":
		return
	elif star != "0":
		$marker.play("aberto")
	

func _on_area_area_entered(area):
	if area.is_in_group("jogador"):
		hud.visible = true
		levelselect.cur_level = name
		stars_hud.play(star)
		print_debug("LEVEL: " + name + "| ESTRELAS: " + star)


func _on_area_area_exited(area):
	if area.is_in_group("jogador"):
		hud.visible = false
		
