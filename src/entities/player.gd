class_name Player
extends KinematicBody2D

var ESTADO : Array = ["IDLE", "MOVE", "DIE"]
var jogador_estado : String = "" setget set_jogador_estado, get_jogador_estado
var jogador_prev_estado
var velocidade_jogador:Vector2 = Vector2(0,0) setget set_velocidade_jogador, get_velocidade_jogador
var speed = 500

onready var animator := $render

# chamada quando o jogador entra na cena
func _ready():
	jogador_estado = ESTADO[0]
	print_debug(jogador_estado)


func _physics_process(delta):
	controls() # lembrar de alterar qualquer tipo de controle aqui

	if velocidade_jogador != Vector2.ZERO:
		set_jogador_estado(ESTADO[1])
	else:
		set_jogador_estado(ESTADO[0])
		$render.rotation_degrees = 0
	
	set_velocidade_jogador(move_and_slide(get_velocidade_jogador()))
	
	if is_on_wall():
		set_velocidade_jogador(Vector2.ZERO)
	
# cuidando dos controles aqui
func controls() -> void:
	var up = Input.is_action_just_pressed("ui_up")
	var down = Input.is_action_just_pressed("ui_down")
	var left = Input.is_action_just_pressed("ui_left")
	var right = Input.is_action_just_pressed("ui_right")

	if get_velocidade_jogador() == Vector2.ZERO:
		if up:
			velocidade_jogador.y = -10
			$render.rotation_degrees = -90
		elif down:
			velocidade_jogador.y = 10
			$render.rotation_degrees = 90
		elif left:
			velocidade_jogador.x = -10
			$render.rotation_degrees = 180
		elif right:
			velocidade_jogador.x = 10
			$render.rotation_degrees = 0
			
	velocidade_jogador = velocidade_jogador.normalized() * speed
	
		
# SETGET player estado
func set_jogador_estado(novo_estado) -> void: 
	jogador_prev_estado = get_jogador_estado()
	jogador_estado = novo_estado
	troca_animacao_jogador(novo_estado)
	
	
func get_jogador_estado() -> String: return jogador_estado


func troca_animacao_jogador(nova_animacao) -> void:
	animator.play(nova_animacao)


# SETGET velocidade jogador 
func set_velocidade_jogador(nova_velocidade) -> void:
	velocidade_jogador = nova_velocidade
	

func get_velocidade_jogador() -> Vector2: return velocidade_jogador


func _on_trigger_body_entered(body):
	pass

func _on_trigger_area_entered(area):
	if area.is_in_group("chave"):
		print_debug("peguei a chave")
	
