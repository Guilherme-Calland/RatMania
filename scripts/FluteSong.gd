extends Node2D


onready var flute_song100 = $FluteSong100

func playFluteSong(score):
	if score < 3:
		if !flute_song100.playing:
			flute_song100.play()

