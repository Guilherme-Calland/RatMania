extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = "stand"
	$AnimatedSprite.play()

func squeek():
	$Squeek.play()

func squaa():
	$Squaak.play()
