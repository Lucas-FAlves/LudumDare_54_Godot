extends CharacterBody2D

@export var speed = 200
var dir = 1
var isOff = true
var motion = Vector2.ZERO
var rng = RandomNumberGenerator.new()
@export var cooldown : int

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	cooldown = rng.randi_range(200, 600)
	
	
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if cooldown > 0:
		isOff = true
		cooldown -= delta
	else:
		isOff = false
		
	if isOff == true:
		eye_move(delta)
		



func eye_move(delta):
	if is_on_wall():
		dir *= -1
	motion.x = speed * dir
	velocity += motion*delta
	move_and_slide()
	
		
