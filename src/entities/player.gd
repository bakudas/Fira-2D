class_name Player
extends KinematicBody2D

enum Estado {IDLE, MOVE, DIE}
var jogador_estado:String = "" setget set_jogador_estado, get_jogador_estado
var jogador_prev_estado:String = ""
var velocidade_jogador:Vector2 = Vector2(0,0) setget set_velocidade_jogador, get_velocidade_jogador
var speed:int = 500

onready var animator := $render

# chamada quando o jogador entra na cena
func _ready():
	set_jogador_estado(Estado.IDLE)
	print_debug(jogador_estado)


func _physics_process(delta):
	controls() # lembrar de alterar qualquer tipo de controle aqui

	if velocidade_jogador != Vector2.ZERO:
		set_jogador_estado(Estado.MOVE)
	else:
		set_jogador_estado(Estado.IDLE)
		$render.rotation_degrees = 0
	
	set_velocidade_jogador(move_and_slide(get_velocidade_jogador()))
	
	if is_on_wall():
		set_velocidade_jogador(Vector2.ZERO)
		Swipe.swipe_direcao = ""
	
# cuidando dos controles aqui
func controls() -> void:
	var up = Input.is_action_just_pressed("ui_up")
	var down = Input.is_action_just_pressed("ui_down")
	var left = Input.is_action_just_pressed("ui_left")
	var right = Input.is_action_just_pressed("ui_right")

	if get_velocidade_jogador() == Vector2.ZERO:
		if up or Swipe.swipe_direcao == "cima":
			velocidade_jogador.y = -10
			$render.rotation_degrees = -90
		elif down or Swipe.swipe_direcao == "baixo":
			velocidade_jogador.y = 10
			$render.rotation_degrees = 90
		elif left or Swipe.swipe_direcao == "esquerda":
			velocidade_jogador.x = -10
			$render.rotation_degrees = 180
		elif right or Swipe.swipe_direcao == "direita":
			velocidade_jogador.x = 10
			$render.rotation_degrees = 0
			
	velocidade_jogador = velocidade_jogador.normalized() * speed


func swipe_controls(direcao) -> void:
	if get_velocidade_jogador() == Vector2.ZERO:
		match direcao:
			"up":
				velocidade_jogador.y = -10
				$render.rotation_degrees = -90
			"down":
				velocidade_jogador.y = 10
				$render.rotation_degrees = 90
			"left":
				velocidade_jogador.x = -10
				$render.rotation_degrees = 180
			"right":
				velocidade_jogador.x = 10
				$render.rotation_degrees = 0

		
# SETGET player estado
func set_jogador_estado(novo_estado) -> void: 
	jogador_prev_estado = get_jogador_estado()
	match novo_estado:
		0:
			jogador_estado = "IDLE"
		1:
			jogador_estado = "MOVE"
		2:
			jogador_estado = "DIE"
	troca_animacao_jogador(jogador_estado)
	
	
	
func get_jogador_estado() -> String: return jogador_estado


func troca_animacao_jogador(nova_animacao) -> void:
	animator.play(nova_animacao)


# SETGET velocidade jogador 
func set_velocidade_jogador(nova_velocidade) -> void:
	velocidade_jogador = nova_velocidade
	

func get_velocidade_jogador() -> Vector2: return velocidade_jogador


