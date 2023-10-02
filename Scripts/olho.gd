extends CharacterBody2D

#Variaveis deste script
@export var speed = 200
var dir = 1
var isOff = true
var motion = Vector2.ZERO
var coinFlip:int
#Cooldown aleatorio pra ativar o sprite do olho
var rng = RandomNumberGenerator.new()
@export var cooldown : int

#referencias
@onready var eyeSprite: CharacterBody2D = self
@onready var eyeAnimatedSprite = get_node("Eye/CollisionShape2D/AnimatedSprite2D")
var tentacleScene = load("res://Prefabs/tentaculo.tscn")
var isTentacleSpawned : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	cooldown = rng.randi_range(200, 400)
	cooldown = 300
	eyeSprite.visible = false
	
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if cooldown > 0:
		isOff = true
		cooldown -= delta
	else:
		isOff = false
		eyeSprite.visible = true
		if eyeAnimatedSprite != null:
			eyeAnimatedSprite.play("Opening")
			spawn_tentacle()
			
	if isOff == true:
		eye_move(delta)
		



func eye_move(delta):
	if is_on_wall():
		dir *= -1
	motion.x = speed * dir
	velocity += motion*delta
	move_and_slide()
	
			
func spawn_tentacle():
	if !isTentacleSpawned:
		var instance = tentacleScene.instantiate()
		var cf = rng.randi_range(0,1)
		if cf == 1:
			coinFlip = 1
		else:
			coinFlip = -1
		#var aux = rng.randf_range(0.0000001,0.0000003)
		var offset = Vector2(rng.randi_range(40,150),0)
		var reference_position = self.position
		var new_position:Vector2 = offset*coinFlip
		
		print("Global position: ",reference_position, "Tipo: ", typeof(reference_position))
		print("Offset :",offset)
		print("Coin Flip: ", coinFlip)
		print("New Position: ",new_position)
#		
		print("Instance Position (before add_child)", instance.position)
		instance.position = new_position
		add_child(instance)
		print("Instance Position (after add_child) ", instance.position)
		
#		instance.position.x = new_position.x
#		instance.position.y = new_position.y
		print("Instance Position (after trying to set it again) ", instance.position)
		
		isTentacleSpawned = true
		
