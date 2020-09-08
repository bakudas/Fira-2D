extends Node2D


export(int, 1, 20) var level:int = 0
export(String, "0", "1", "2", "3") var star:String = "3"
export(bool) var completo:bool = false


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
	
