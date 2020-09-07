class_name Key
extends Area2D

signal chave_coletada


#destruir a chave ao ser coletada
func destruir_chave():
	#$sprite.visible = false
	queue_free()
	

# vfx para tocar quando a chave for pega
func chave_FX():
	pass
	

# checa se o jogador colide com a chave
func _on_Area2D_body_entered(body):
	if body.is_in_group("jogador"):
		emit_signal("chave_coletada")
		destruir_chave()
		chave_FX()

