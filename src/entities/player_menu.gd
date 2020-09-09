extends Sprite

var speed : = 400.0
var path : = PoolVector2Array() setget set_path


func _ready():
	set_process(false)


func _process(delta) -> void:
	var move_distance = speed * delta
	move_along_path(move_distance)
	

func move_along_path(distance : float) -> void:
	var start_point = position
	for i in range(path.size()):
		var distance_to_next = start_point.distance_to(path[0])
		if path[0].x < position.x:
			rotation_degrees = 180
		if path[0].x > position.x:
			rotation_degrees = 0
		if path[0].y - 10 < position.y:
			rotation_degrees = -90
		if path[0].y + 10 > position.y:
			rotation_degrees = 90
		if distance <= distance_to_next and distance >= 0:
			position = start_point.linear_interpolate(path[0], distance / distance_to_next)
			$render.play("MOVE")
			break
		elif distance < 0:
			position = path[0]
			set_process(false)
			break
		$render.play("IDLE")
		rotation_degrees = 0
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)	
			

func set_path(value : PoolVector2Array) -> void:
	path = value
	if value.size() == 0:
		return
	set_process(true)
