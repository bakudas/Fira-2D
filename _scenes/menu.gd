extends Node2D


func _ready():
	$Persistence.mode = Persistence.Mode.TEXT
	
	var data = $Persistence.get_data("Levels")
	print(data)
	

func _on_button_animation_finished():
	get_tree().change_scene("res://_scenes/levels/level1.tscn")
