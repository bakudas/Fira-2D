extends AnimatedSprite


func _input(event):
	if not event is InputEventScreenTouch:
		return
	if event.is_pressed():
		play("pressed")
	
