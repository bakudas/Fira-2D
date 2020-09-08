extends Node2D


func _ready():
	$anim.play("boom")


func _on_AnimatedSprite_animation_finished():
	queue_free()
