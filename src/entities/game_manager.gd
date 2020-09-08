class_name game_manager
extends Node

signal abrir_porta_level

var estado_jogo := ["parado", "jogando", "vitoria"]
var cur_level := 1
var prev_level := 0
export(String) var proxima_fase


func abri_porta_level():
	print_debug("PEGUEI A CHAVE")
	emit_signal("abrir_porta_level")


func _on_chave_chave_coletada():
	abri_porta_level()


func _on_trigger_level_body_entered(body):
	if body.is_in_group("jogador"):
		print_debug("passei de fase " + body.name)
		Swipe.swipe_direcao = ""
		get_tree().change_scene(proxima_fase)
