extends RigidBody2D

@export var move_speed = 100  # Velocidade de movimento
@export var move_direction = Vector2.DOWN  # Direção inicial
var is_moving = false  # Indica se o RigidBody2D está se movendo
@export var move_limit = Vector2 (0,100)  # Limite para onde o RigidBody2D deve se mover

var initialPosition

func _ready():
	# Obtém a posição inicial do objeto
	initialPosition = global_position  # Ou use "position" em vez de "global_position" se for relativa ao nó pai
	initialPosition += move_limit
	start_movement()

func _process(delta):
	if is_moving:
		# Move o RigidBody2D na direção especificada
		var motion = move_direction * move_speed * delta
		print(motion)
		global_position += motion
		sound_manager.playAudio("WallMoving")

		# Verifica se atingiu o limite
		if global_position.y >= initialPosition.y:
			is_moving = false
			print("parou")
			sound_manager.stopAudio("WallMoving")

func start_movement():
	# Inicia o movimento
	is_moving = true

func stop_movement():
	# Para o movimento
	sound_manager.stopAudio("WallMoving")
	is_moving = false
