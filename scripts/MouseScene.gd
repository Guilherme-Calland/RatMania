extends KinematicBody2D

var flipped = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = "fidget"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimatedSprite.flip_h = flipped
	$AnimatedSprite.play()

func set_flipped(b):
	flipped = b

func squeek():
	$Squeek.play()

func squaak():
	$Squaak.play()

