extends Node2D

onready var flute_text_0 = preload("res://SPRITES/FLAUTA/FLAUTA 1.png")
onready var flute_text_1 = preload("res://SPRITES/FLAUTA/FLAUTA 2.png")
onready var Flute = $Flute

func fluteMovement(elapsed):
	var elapsedMod = elapsed%1000
	if elapsedMod >= 0 && elapsedMod <=100:
		Flute.texture = flute_text_1
	elif elapsedMod >= 500 && elapsedMod <= 600:
		Flute.texture = flute_text_0