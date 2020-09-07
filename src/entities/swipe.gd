extends Node

# signal swipe

var swipe_start = null
var minimum_drag = 100
var swipe_direcao

var timer:Timer = Timer.new()

func _ready():
	add_child(timer)

func _input(event):
	if not event is InputEventScreenTouch:
		return
	if event.is_pressed():
		swipe_start = event.position
		timer.start(.7)
	elif not timer.is_stopped():
		_calculate_swipe(event.position)
		print_debug("estamos aqui no tempo ")
		
func _calculate_swipe(swipe_end):
	timer.stop()
	if swipe_start == null: 
		return
	var swipe = swipe_end - swipe_start
	# print(swipe)
	if abs(swipe.x) > minimum_drag and abs(swipe.y) < minimum_drag:
		if swipe.x > 0:
			# emit_signal("swipe", "right")
			swipe_direcao = "direita"
			print_debug("direita")
		elif swipe.x < 0:
			# emit_signal("swipe", "left")
			swipe_direcao = "esquerda"
			print_debug("esquerda")
	if abs(swipe.y) > minimum_drag and abs(swipe.x) < minimum_drag:
		if swipe.y > 0:
			# emit_signal("swipe", "down")
			swipe_direcao = "baixo"
			print_debug("baixo")
		else:
			# emit_signal("swipe", "up")
			swipe_direcao = "cima"
			print_debug("cima")
