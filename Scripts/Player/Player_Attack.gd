extends Area2D

var EnemyInArea = false
var olho
@export var attackSpeed:float = 3
@onready var playerSprite: AnimatedSprite2D = get_parent().get_node("AnimatedSprite2D")
@onready var jogador = get_parent().get_parent()
@onready var soundManager = get_node("/root/sound_manager")
var killNode = false
signal playerAttacked

func _process(delta):
	if Input.is_action_just_released("Attack"):
		playerSprite.play("Attacking", attackSpeed)
		sound_manager.playAudio("CharacterAttacking")
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
		playerAttacked.emit()
		var canva_olho: CanvasItem = olho
		olho.get_node("CollisionShape2D/AnimatedSprite2D").play("Closing")
		print("AtackHit")
		sound_manager.playAudio("EyesClosing")
		#olho.queue_free()
		canva_olho.visible = false
		olho.wall.stop_movement()
	jogador.set_physics_process(true) 
