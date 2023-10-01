extends CollisionShape2D

func _process(delta):
	rotate(get_angle_to(get_global_mouse_position()) - 1.5708)
	#look_at(get_global_mouse_position())
