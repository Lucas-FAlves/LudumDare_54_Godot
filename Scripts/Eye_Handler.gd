extends Area2D

@onready var animatedSprite2D: AnimatedSprite2D = $CollisionShape2D/AnimatedSprite2D
@onready var canvasItem: CanvasItem = $CollisionShape2D/Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	animatedSprite2D.play("Opening")
	
func _on_tree_exiting():
	animatedSprite2D.play("Closing")

func _on_animated_sprite_2d_animation_finished():
	if animatedSprite2D.animation == "Opening":
		canvasItem.visible = true
		var animSprite:CanvasItem = $CollisionShape2D/AnimatedSprite2D
		animSprite.visible = false
		animatedSprite2D.stop()
	if animatedSprite2D.animation == "Closing":
		print("Tocou closing")
		queue_free()
	
