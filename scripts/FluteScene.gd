extends Node2D


onready var flute_text_0 = preload("res://SPRITES/SKATE SPRITE/s1.png")
onready var flute_text_1 = preload("res://SPRITES/SKATE SPRITE/s2.png")
onready var flute_text_2 = preload("res://SPRITES/SKATE SPRITE/s3.png")
onready var flute_text_4 = preload("res://SPRITES/SKATE SPRITE/s4.png")

onready var Flute = $Flute


func fluteMovement(elapsed):
	var elapsedMod = elapsed%4000
	if elapsedMod >= 0 && elapsedMod <= 100:
		Flute.texture = flute_text_2
	elif elapsedMod >= 250 && elapsedMod <= 350:
		Flute.texture = flute_text_1
	elif elapsedMod >= 500 && elapsedMod <= 600:
		Flute.texture = flute_text_0
	elif elapsedMod >= 1000 && elapsedMod <= 1100:
		Flute.texture = flute_text_4
	elif elapsedMod >= 1500 && elapsedMod <= 1600:
		Flute.texture = flute_text_0
	elif elapsedMod >= 2000 && elapsedMod <= 2100:
		Flute.texture = flute_text_4
	elif elapsedMod >= 2500 && elapsedMod <= 2600:
		Flute.texture = flute_text_0
	elif elapsedMod >= 3000 && elapsedMod <= 3100:
		Flute.texture = flute_text_4
	elif elapsedMod >= 3500 && elapsedMod <= 3600:
		Flute.texture = flute_text_0

		
