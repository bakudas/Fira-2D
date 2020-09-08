extends Node2D


func _ready():
	var db = Data.get_data("Levels")
	#print(db)
	var stars = db.get("Stars")
	print(stars.get("Level1"))
	
	var levels = get_node("levels")
	
	var i = 1
	for child in levels.get_children():
		child.star = stars.get("Level" + str(i))
		i = i + 1
		child.update_stars()
		print(child.star)
