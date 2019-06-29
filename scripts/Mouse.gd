extends Node2D

var mouseCount = 0

onready var mouse_text_0 = preload("res://SPRITES/RATINHO/RATINHO.png")
onready var mouse_text_1 = preload("res://SPRITES/RATINHO/RATINHO_INCL.png")

onready var MouseTemp = $MouseTemp/MouseTemp
onready var Mouse0 = $Mice/Mouse0
onready var Mouse1 = $Mice/Mouse1
onready var Mouse2 = $Mice/Mouse2
onready var Mouse3 = $Mice/Mouse3
onready var Mouse4 = $Mice/Mouse4
onready var Mouse5 = $Mice/Mouse5
onready var Mouse6 = $Mice/Mouse6
onready var Mouse7 = $Mice/Mouse7
onready var Mouse8 = $Mice/Mouse8
onready var Mouse9 = $Mice/Mouse9

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
		Mouse4.texture = mouse_text_0
		Mouse5.texture = mouse_text_1
		Mouse6.texture = mouse_text_0
		Mouse7.texture = mouse_text_1
		Mouse8.texture = mouse_text_0
		Mouse9.texture = mouse_text_1
		
	else:
		MouseTemp.texture = mouse_text_1
		Mouse0.texture = mouse_text_1
		Mouse1.texture = mouse_text_0
		Mouse2.texture = mouse_text_1
		Mouse3.texture = mouse_text_0
		Mouse4.texture = mouse_text_1
		Mouse5.texture = mouse_text_0
		Mouse6.texture = mouse_text_1
		Mouse7.texture = mouse_text_0
		Mouse8.texture = mouse_text_1
		Mouse9.texture = mouse_text_0
	mouseCount = mouseCount + speed
	
func getMouse(score):
	if score == 0:
		return Mouse0
	elif score == 1:
		return Mouse1
	elif score == 2:
		return Mouse2
	elif score == 3:
		return Mouse3
	elif score == 4:
		return Mouse4
	elif score == 5:
		return Mouse5
	elif score == 6:
		return Mouse6
	elif score == 7:
		return Mouse7
	elif score == 8:
		return Mouse8
	elif score == 9:
		return Mouse9
	else:
		 return Mouse0