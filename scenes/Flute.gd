extends Node2D

onready var flute_text_0 = preload("res://SPRITES/FLAUTA/FLAUTA 1.png")
onready var flute_text_1 = preload("res://SPRITES/FLAUTA/FLAUTA 2.png")
onready var Flute = $Flute

var fluteCount = 0

func fluteMovement(speed):
	if fluteCount >= 120:
		fluteCount = 0
	if fluteCount < 60:
		Flute.texture = flute_text_0
	else:
		Flute.texture = flute_text_1
	fluteCount = fluteCount + speed
	pass