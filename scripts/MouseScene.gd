extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = "fidget"
	$AnimatedSprite.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
