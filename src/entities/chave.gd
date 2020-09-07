class_name Key
extends Area2D

signal chave_coletada


func destruir_chave():
	#$sprite.visible = false
	queue_free()
	

func chave_FX():
	pass
	
	
func _on_Area2D_body_entered(body):
	if body.is_in_group("jogador"):
		emit_signal("chave_coletada")
		destruir_chave()
		chave_FX()

