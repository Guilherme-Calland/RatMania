extends Node2D

onready var Unit = $Unit
onready var Decimal = $Decimal

func setScore(score):
	var unit = score%10
	match unit:
		0:
			Unit.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_0.png")
		1:
			Unit.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_1.png")
		2:
			Unit.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_2.png")
		3:
			Unit.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_3.png")
		4:
			Unit.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_4.png")
		5:
			Unit.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_5.png")
		6:
			Unit.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_6.png")
		7:
			Unit.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_7.png")
		8:
			Unit.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_8.png")
		9:
			Unit.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_9.png")
	
	if score < 10:
		Decimal.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_0.png")
	elif score < 20:
		Decimal.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_1.png")
	elif score < 30:
		Decimal.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_2.png")
	elif score < 40:
		Decimal.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_3.png")
	elif score < 50:
		Decimal.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_4.png")
	elif score < 60:
		Decimal.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_5.png")
	elif score < 70:
		Decimal.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_6.png")
	elif score < 80:
		Decimal.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_7.png")
	elif score < 90:
		Decimal.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_8.png")
	elif score < 100:
		Decimal.texture = preload("res://SPRITES/RATO_SCORE/NUMERO_9.png")
		
