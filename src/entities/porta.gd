extends Sprite

# destroi a porta
func _on_game_manager_abrir_porta_level():
	$porta.queue_free()
