extends CharacterBody2D

@export var max_speed = 300
@export var aceleration = 1500
@export var friction = 1200
@export var axis = Vector2.ZERO
@export var animSpeed: float = 2
var isFrozen = false

func _physics_process(delta):
	move(delta)
 
func get_input_Axis():
	#Verifica se o jogador tá pressionando para ir em direções opostas, se tiver elas se anulam
	axis.x = int(Input.is_action_pressed("Move_Right"))-int(Input.is_action_pressed("Move_Left"))
	axis.y = int(Input.is_action_pressed("Move_Down"))-int(Input.is_action_pressed("Move_Up"))
	return axis

func move(delta):
	axis = get_input_Axis()
	
	if axis == Vector2.ZERO:
		#Aplica fricção para parar o personagem do jogador se não houver input
		apply_friction(friction*delta)
	else:
		#aplica movimento se houver input
		apply_movement(axis*aceleration*delta)
	move_and_slide()

func apply_friction(amount):
	if velocity.length() > amount:
		$PlayerCollider/AnimatedSprite2D.stop()
		velocity -= velocity.normalized() * amount
	else:
		velocity = Vector2.ZERO

func apply_movement(accel):
	$PlayerCollider/AnimatedSprite2D.play("Walking", animSpeed)
	velocity += accel
	#não deixa o jogador passar de uma velocidade máxima
	velocity = velocity.limit_length(max_speed)


