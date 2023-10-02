extends Node

func playAudio(nome: String):
	var audio: AudioStreamPlayer2D = get_node(nome)
	audio.play()
	
