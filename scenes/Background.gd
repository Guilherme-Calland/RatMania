extends Node2D

onready var Background0 = $".."/Background/Background0
onready var Background1 = $Background/Background1

func _ready():
	set_process(true)
	pass # Replace with function body.

func backgroundRoll():
	if Background0.position.x  <= -500:
		Background0.position.x = 1500
	if Background1.position.x <= -500:
		Background1.position.x = 1500
	Background0.position.x -= 1
	Background1.position.x -= 1
	pass
	
