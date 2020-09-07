class_name game_manager
extends Node

signal abrir_porta_level

var estado_jogo := ["parado", "jogando", "vitoria"]
var cur_level := 1
var prev_level := 0


func abri_porta_level():
	print_debug("PEGUEI A CHAVE")


func _on_chave_chave_coletada():
	abri_porta_level()
