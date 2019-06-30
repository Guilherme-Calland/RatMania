extends Node2D

onready var animated_sprite = self.get_node("AnimatedSprite")

func _ready():
	animated_sprite.animation = "walk"
	animated_sprite.play()
