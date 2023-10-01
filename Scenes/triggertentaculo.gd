extends Area2D

const pushStrength = 10  # Força do empurrão
const stunDuration = 1.0  # Duração do atordoamento em segundos

var playerInArea = false

func _process(delta):
	if playerInArea:
		# Empurrar o jogador na direção oposta à área
		var player = get_node("/root/Level/Player_Character")  # Substitua pelo caminho correto para o jogador
		var direction = (player.global_position - global_position).normalized()
		#player.global_position = Vector2(-direction*pushStrength)
		playerInArea = false  # Evitar empurrões repetidos
	
#func _on_Area2D_body_entered(body):
	#if body.name == "Player_Character":  # Substitua pelo nome correto do jogador
	#	playerInArea = true
	#	body.set_physics_process(false)  # Impedir o movimento do jogador
	#	$Timer.wait_time = stunDuration
	#	$Timer.start()

#func _on_Area2D_body_entered(body):


func _on_body_entered(body):
	if body.name == "Player_Character":  # Substitua pelo nome correto do jogador
		playerInArea = true
		body.set_physics_process(false)  # Impedir o movimento do jogador
		$Timer.wait_time = stunDuration
		$Timer.start()



func _on_timer_timeout():
	var player = get_node("/root/Level/Player_Character")  # Substitua pelo caminho correto para o jogador
	player.set_physics_process(true)  # Restaurar o movimento do jogador
