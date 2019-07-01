extends Node2D

onready var GameOverSong = self.get_node("GameOverSong")

func _ready():
	#################################
	var volume = -10
	################################
	GameOverSong.set_volume_db(volume)
	GameOverSong.play()
