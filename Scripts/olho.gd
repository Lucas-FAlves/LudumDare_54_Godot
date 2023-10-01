extends CharacterBody2D


@export var speed = 200
var dir = 1
var isOff = false
var motion : float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	eye_move(delta)



func eye_move(delta):
	if is_on_wall():
		dir *= -1
	motion = speed * dir
	move_and_slide()
