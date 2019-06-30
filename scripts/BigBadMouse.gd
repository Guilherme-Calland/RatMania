extends Node2D

onready var animated_sprite = self.get_node("AnimatedSprite")
onready var squeek_song = self.get_node("Squeek")
onready var squaak_song = self.get_node("Squaak")

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.animation = "stand"
	animated_sprite.play()

func squeek():
	squeek_song.play()

func squaa():
	squaak_song.play()
