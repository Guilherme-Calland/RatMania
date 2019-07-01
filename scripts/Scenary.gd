extends Node2D

onready var Background0 = get_node("Background/Background0")
onready var Background1 = get_node("Background/Background1")
onready var Tile = get_node("Tile/Tile")
onready var Tile2 = get_node("Tile/Tile2")
onready var tile_posX = Tile.position.x
onready var tile2_posX = Tile2.position.x

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
		Tile2.position.x =tile2_posX
		tileCounter = 0
	Tile.position.x -= speed
	Tile2.position.x -= speed
	tileCounter += speed
	pass
	
func scenaryRoll(speed):
	backgroundRoll()
	tileRoll(speed)
	pass
	
