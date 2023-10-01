extends Area2D

var EnemyInArea = false
var olho
@export var attackSpeed:float = 3
@onready var playerSprite: AnimatedSprite2D = get_parent().get_node("AnimatedSprite2D")
@onready var jogador = get_parent().get_parent()
var killNode = false

func _process(delta):
	if Input.is_action_just_released("Attack"):
		playerSprite.play("Attacking", attackSpeed)
		jogador.set_physics_process(false)  # Impedir o movimento do jogador
		if EnemyInArea:
			killNode = true
			EnemyInArea = false  

func _on_area_entered(area):
	if area.name == "Eye":  # Substitua pelo nome correto do jogador
		olho = area
		EnemyInArea = true

func _on_area_exited(area):
	if area.name == "Eye":  # Substitua pelo nome correto do jogador
		EnemyInArea = false

func _on_animated_sprite_2d_animation_finished():
	if killNode:
		killNode = false
		olho.get_node("CollisionShape2D/AnimatedSprite2D").play("Closing")
		olho.queue_free()
		print("matou polvo")
	jogador.set_physics_process(true) 
