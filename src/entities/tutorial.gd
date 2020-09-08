extends Node2D


export(String, "hand_tutorial_01") var tutorial_tipo

func _ready():
	$anim.play(tutorial_tipo)

