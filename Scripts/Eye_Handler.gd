extends Area2D

var animatedSprite2D: AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	animatedSprite2D = $CollisionShape2D/Sprite2D/AnimatedSprite2D
	animatedSprite2D.play("Opening")
	
func _on_tree_exiting():
	animatedSprite2D.play("Closing")


func _on_animated_sprite_2d_animation_finished():
	animatedSprite2D.stop()
	animatedSprite2D.pause()
