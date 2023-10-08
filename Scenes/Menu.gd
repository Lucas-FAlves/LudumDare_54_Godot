extends Control


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level.tscn")


func _on_controls_pressed():
	get_tree().change_scene_to_file("res://Scenes/controls.tscn")
	

func _on_quit_pressed():
	get_tree().quit()
