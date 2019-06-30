extends Control

onready var start_scene = "res://scenes/Game.tscn"

func _ready():
	$MenuSong.play()

func _on_StartButton2_pressed():
	get_tree().change_scene(start_scene)
