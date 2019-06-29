extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if randf() > 0.5:
		$Squeek.play()
	else:
		$Squaak.play()
	$AnimatedSprite.animation = "fidget"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimatedSprite.play()

func squeek():
	$Squeek.play()

func squaak():
	$Squaak.play()

