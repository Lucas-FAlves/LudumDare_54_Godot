extends Area2D

var EnemyInArea = false
var olho

func _process(delta):
	if Input.is_action_just_released("Attack"):
		#Tocar animação do jogador atacando
		if EnemyInArea:
			killNode(olho)
			EnemyInArea = false  

func killNode(no):
	#Tocar animação do olho morrendo/fechando
	no.queue_free()

func _on_area_entered(area):
	if area.name == "Eye":  # Substitua pelo nome correto do jogador
		olho = area
		EnemyInArea = true
		print(EnemyInArea)	
	


func _on_area_exited(area):
	if area.name == "Eye":  # Substitua pelo nome correto do jogador
		EnemyInArea = false
		print(EnemyInArea)
	
