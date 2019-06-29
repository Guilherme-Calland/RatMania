extends Node2D

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
onready var Mouse10 = $Mice/Mouse10

onready var Score = $Score

onready var squeek = $MouseTemp/Squeek
onready var squaak = $MouseTemp/Squaak


func mouseMovement(elapsed):
	var elapsedMod = elapsed%1000
	if elapsedMod >= 0 && elapsedMod <=100:
		MouseTemp.texture = mouse_text_0
		Mouse1.texture = mouse_text_1
		Mouse2.texture = mouse_text_0
		Mouse3.texture = mouse_text_1
		Mouse4.texture = mouse_text_0
		Mouse5.texture = mouse_text_1
		Mouse6.texture = mouse_text_0
		Mouse7.texture = mouse_text_1
		Mouse8.texture = mouse_text_0
		Mouse9.texture = mouse_text_1
		Mouse10.texture = mouse_text_0
	elif elapsedMod >=500 && elapsedMod <= 600:
		MouseTemp.texture = mouse_text_1
		Mouse1.texture = mouse_text_0
		Mouse2.texture = mouse_text_1
		Mouse3.texture = mouse_text_0
		Mouse4.texture = mouse_text_1
		Mouse5.texture = mouse_text_0
		Mouse6.texture = mouse_text_1
		Mouse7.texture = mouse_text_0
		Mouse8.texture = mouse_text_1
		Mouse9.texture = mouse_text_0
		Mouse10.texture = mouse_text_1
	
func getMouse(score):
	match score:
		0:
			Score.texture = preload("res://SPRITES/RATO SCORE/RATO SCORE_00.png")
			return Mouse0
		1:
			Score.texture = preload("res://SPRITES/RATO SCORE/RATO SCORE_01.png")
			return Mouse1
		2:
			Score.texture = preload("res://SPRITES/RATO SCORE/RATO SCORE_02.png")
			return Mouse2
		3:
			Score.texture = preload("res://SPRITES/RATO SCORE/RATO SCORE_03.png")
			return Mouse3
		4:
			Score.texture = preload("res://SPRITES/RATO SCORE/RATO SCORE_04.png")
			return Mouse4
		5:
			Score.texture = preload("res://SPRITES/RATO SCORE/RATO SCORE_05.png")
			return Mouse5
		6:
			Score.texture = preload("res://SPRITES/RATO SCORE/RATO SCORE_06.png")
			return Mouse6
		7:
			Score.texture = preload("res://SPRITES/RATO SCORE/RATO SCORE_07.png")
			return Mouse7
		8:
			Score.texture = preload("res://SPRITES/RATO SCORE/RATO SCORE_08.png")
			return Mouse8
		9:
			Score.texture = preload("res://SPRITES/RATO SCORE/RATO SCORE_09.png")
			return Mouse9
		10:
			Score.texture = preload("res://SPRITES/RATO SCORE/RATO SCORE_10.png")
			return Mouse10
		_:
			return Mouse0