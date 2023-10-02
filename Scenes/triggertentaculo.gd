extends Area2D

const pushStrength = 10  # Força do empurrão
@export var stunDuration: float = 1.0  # Duração do atordoamento em segundos
@onready var player = get_node("/root/Level/Player_Character")
@onready var hitArea: CanvasItem = $CollisionShape2D/Sprite2D
var playerInArea = false
var time_to_attack = 3

func _process(delta):
	pass
	#if playerInArea:
		# Empurrar o jogador na direção oposta à área
		# Substitua pelo caminho correto para o jogador
		#var direction = (player.global_position - global_position).normalized() * delta
		#player.global_position = Vector2(-direction*pushStrength)
	#	playerInArea = false  # Evitar empurrões repetidos

func _on_body_entered(body):
	if body.name == "Player_Character":  # Substitua pelo nome correto do jogador
		playerInArea = true
		hitArea.visible = true
		$CollisionShape2D/Sprite2D/Timer.wait_time = time_to_attack
		$CollisionShape2D/Sprite2D/Timer.start()
		#body.set_physics_process(false)  # Impedir o movimento do jogador
		

func _on_timer_timeout():
	playerInArea= false
	player.set_physics_process(true)
	hitArea.visible=false
	#if attacked == false:
		#if playerInArea == true:
			#player.set_physics_process(false)
			#attacked = true
		#player.set_physics_process(true)  # Restaurar o movimento do jogador

func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation=="Attack":
		if playerInArea == true:
			playerInArea=false
			player.set_physics_process(false)
			$Timer.wait_time = stunDuration
			$Timer.start()
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("Spawn", true)
		#attacked = false

func _on_body_exited(body):
	if body.name == "Player_Character":
		playerInArea = false

#func _on_Area2D_body_entered(body):
	#if body.name == "Player_Character":  # Substitua pelo nome correto do jogador
	#	playerInArea = true
	#	body.set_physics_process(false)  # Impedir o movimento do jogador
	#	$Timer.wait_time = stunDuration
	#	$Timer.start()
#func _on_Area2D_body_entered(body):

func _on_timer_Canva_timeout():
	$AnimatedSprite2D.play("Attack",2)
	$Timer.wait_time = 10
	$Timer.start()	 # Replace with function body.
