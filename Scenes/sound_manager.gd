extends Node

func playAudio(nome: String):
	var audio: AudioStreamPlayer2D = get_node(nome)
	audio.play()

func stopAudio(nome: String):
	var audio: AudioStreamPlayer2D = get_node(nome)
	audio.stop()
