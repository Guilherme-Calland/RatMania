extends Node2D


onready var flute_song100 = $FluteSong100

func playFluteSong():
		flute_song100.play()

func set_global_volume(volume):
	$FluteSong100.set_volume_db(volume)
	$"C#".set_volume_db(volume)
	$"F#".set_volume_db(volume)
	$"G#".set_volume_db(volume)
	$A.set_volume_db(volume)
	$B.set_volume_db(volume)
	$D.set_volume_db(volume)
	$E.set_volume_db(volume)
	$Elow.set_volume_db(volume)
	$Flow.set_volume_db(volume)
	$".."/Mouse/MouseTemp/Squeek.set_volume_db(volume)
	$".."/Mouse/MouseTemp/Squaak.set_volume_db(volume)
	