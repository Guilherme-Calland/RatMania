extends Node2D

onready var Background0 = $Background/Background0
onready var Background1 = $Background/Background1
onready var Tile = $Tile/Tile
onready var tile_posX = Tile.position.x

var tileCounter = 0

func backgroundRoll():
	if Background0.position.x  <= -500:
		Background0.position.x = 1500
	if Background1.position.x <= -500:
		Background1.position.x = 1500
	Background0.position.x -= 1
	Background1.position.x -= 1
	pass

func tileRoll(speed):
#	if Tile.position.x <= -640:
#		Tile.position.x = 0
	if tileCounter >= 640:
		Tile.position.x =tile_posX
		tileCounter = 0
	Tile.position.x -= speed
	tileCounter += speed
	pass
	
func scenaryRoll(speed):
	backgroundRoll()
	tileRoll(speed)
	pass
	
