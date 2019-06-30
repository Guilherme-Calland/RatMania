extends Node2D

onready var animated_sprite = self.get_node("AnimatedSprite")

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.animation = "fidget"
	animated_sprite.play()
