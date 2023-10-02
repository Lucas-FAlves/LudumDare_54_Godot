extends Area2D

const pushStrength = 10  # Força do empurrão
const stunDuration = 1.0  # Duração do atordoamento em segundos
@onready var player = get_node("/root/Level/Player_Character")
var playerInArea = false
var attacked: bool = false
var expulsion: bool = false
@export var push_strength = 100
func _process(delta):
	if playerInArea and expulsion:
		# Empurrar o jogador na direção oposta à área
		# Substitua pelo caminho correto para o jogador
		#var direction = (player.global_position - global_position).normalized() * delta
		#player.global_position = Vector2(-direction*pushStrength)
		var push_direction = (self.global_position - player.global_position).normalized()
		var push_force = push_direction * push_strength        
		
		#player.apply_impulse(Vector2.ZERO, push_force)
		playerInArea = false  # Evitar empurrões repetidos

func _on_body_entered(body):
	if body.name == "Player_Character":  # Substitua pelo nome correto do jogador
		playerInArea = true
		#body.set_physics_process(false)  # Impedir o movimento do jogador
		$AnimatedSprite2D.play("Attack")
		$Timer.wait_time = 10
		$Timer.start()

func _on_timer_timeout():
	if attacked == false:
		if playerInArea == true:
			#player.set_physics_process(false)
			attacked = true
			expulsion = true
		#player.set_physics_process(true)  # Restaurar o movimento do jogador

func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation=="Attack":
		$AnimatedSprite2D.play("Spawn", true)
		attacked = false

func _on_body_exited(body):
	if body.name == "Player_Character":
		playerInArea = false
		expulsion = false

#func _on_Area2D_body_entered(body):
	#if body.name == "Player_Character":  # Substitua pelo nome correto do jogador
	#	playerInArea = true
	#	body.set_physics_process(false)  # Impedir o movimento do jogador
	#	$Timer.wait_time = stunDuration
	#	$Timer.start()
#func _on_Area2D_body_entered(body):
