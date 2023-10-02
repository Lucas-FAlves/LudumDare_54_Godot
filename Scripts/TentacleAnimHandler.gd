extends AnimatedSprite2D

@onready var default_sprite: CanvasItem = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	play("Spawn")

func _on_animation_finished():
	if animation=="Spawn":
		stop()
