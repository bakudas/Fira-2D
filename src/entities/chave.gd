class_name Key
extends Area2D

signal chave_coletada


#destruir a chave ao ser coletada
func destruir_chave() -> void:
	#$sprite.visible = false
	queue_free()
	

# vfx para tocar quando a chave for pega
func chave_FX() -> void:
	pass
	

#tocar audio quando a chave for coletada
func play_audio() -> void:
	$audio.play()


# checa se o jogador colide com a chave
func _on_Area2D_body_entered(body):
	if body.is_in_group("jogador"):
		if $sprite.visible == true:
			emit_signal("chave_coletada")


func _on_chave_chave_coletada():
	play_audio()
	$sprite.visible = false
	yield(get_tree().create_timer(.7), "timeout")
	destruir_chave()
