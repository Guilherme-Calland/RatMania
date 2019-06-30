extends KinematicBody2D

export var speed = 400 # horizontal speed (pixels/sec)

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
