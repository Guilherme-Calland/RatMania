extends Control

onready var start_scene = "res://scenes/Game.tscn"
onready var menu_song = self.get_node("MenuSong")

func _ready():
	menu_song.play()

func _on_StartButton2_pressed():
	get_tree().change_scene(start_scene)
