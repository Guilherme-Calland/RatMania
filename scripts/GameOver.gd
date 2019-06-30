extends Node2D

onready var GameOverSong = self.get_node("GameOverSong")

func _ready():
	GameOverSong.play()
