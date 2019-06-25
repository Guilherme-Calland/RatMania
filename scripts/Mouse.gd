extends Node2D

var mouseCount = 0

onready var mouse_text_0 = preload("res://SPRITES/RATINHO/RATINHO.png")
onready var mouse_text_1 = preload("res://SPRITES/RATINHO/RATINHO_INCL.png")

onready var MouseTemp = $MouseTemp/MouseTemp
onready var Mouse0 = $Mice/Mouse0
onready var Mouse1 = $Mice/Mouse1
onready var Mouse2 = $Mice/Mouse2
onready var Mouse3 = $Mice/Mouse3

onready var squeek = $MouseTemp/Squeek
onready var squaak = $MouseTemp/Squaak


func mouseMovement(speed, score):
	if mouseCount >= 120:
		mouseCount = 0
	if mouseCount < 60:
		MouseTemp.texture = mouse_text_0
		Mouse0.texture = mouse_text_0
		Mouse1.texture = mouse_text_1
		Mouse2.texture = mouse_text_0
		Mouse3.texture = mouse_text_1
		
	else:
		MouseTemp.texture = mouse_text_1
		Mouse0.texture = mouse_text_1
		Mouse1.texture = mouse_text_0
		Mouse2.texture = mouse_text_1
		Mouse3.texture = mouse_text_0
	mouseCount = mouseCount + speed
	pass