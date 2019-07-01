extends Control

onready var start_scene = "res://scenes/Game.tscn"
onready var menu_song = self.get_node("MenuSong")

func _ready():
	var volume = -10
	menu_song.set_volume_db(volume)
	menu_song.play()

func _on_StartButton2_pressed():
	get_tree().change_scene(start_scene)
