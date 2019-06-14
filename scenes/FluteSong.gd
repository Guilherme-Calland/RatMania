extends Node2D


onready var flute_song100 = $FluteSong100
onready var flute_song120 = $FluteSong120
onready var flute_song140 = $FluteSong140
onready var flute_song200 = $FluteSong200

func playFluteSong(score):
	if score < 4:
		if !flute_song100.playing:
			flute_song120.stop()
			flute_song100.play()
	elif score < 8:
		if !flute_song120.playing:
			flute_song100.stop()
			flute_song140.stop()
			flute_song120.play()
	elif score < 12:
		if !flute_song140.playing:
			flute_song120.stop()
			flute_song200.stop()
			flute_song140.play()
	else:
		if !flute_song200.playing:
			flute_song140.stop()
			flute_song120.play()
	pass