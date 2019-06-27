extends Node2D

#tempo
var time = 0
#velocidade
var speed = 2
#pontuacao
var score = 0

#ratos
onready var MouseTemp = $Mouse/MouseTemp/MouseTemp
onready var Mouse0 = $Mouse/Mice/Mouse0
onready var Mouse1 = $Mouse/Mice/Mouse1
onready var Mouse2 = $Mouse/Mice/Mouse2
onready var Mouse3 = $Mouse/Mice/Mouse3

onready var squeek = $Mouse/MouseTemp/Squeek
onready var squaak = $Mouse/MouseTemp/Squaak

onready var flute_song100 = $FluteSong/FluteSong100
onready var note_1 = $FluteSong/note_1
onready var note_2 = $FluteSong/note_2

onready var S = $Keys/S
onready var K = $Keys/K

onready var S_text = preload("res://SPRITES/TECLADO/S.png")
onready var S_pressed_text = preload("res://SPRITES/TECLADO/S_pressed.png")
onready var K_text = preload("res://SPRITES/TECLADO/K.png")
onready var K_pressed_text = preload("res://SPRITES/TECLADO/K_pressed.png")


onready var acerto0 = false
onready var acerto1 = false

func _ready():
	set_process(true)
	pass 


func _process(delta):
	
	$Scenary.scenaryRoll(speed)
	$Flute.fluteMovement(speed)
	$Mouse.mouseMovement(speed, score)
	$FluteSong.playFluteSong(score)
	
	#tutorial################
	if time == 30:
		S.show()
	if time == 55:
		MouseTemp.show()
		squeek.play()
	if time == 90:
		S.texture = S_pressed_text
		note_1.play()
		MouseTemp.hide()
	if time == 110:
		S.texture = S_text
	if time == 115: 
		S.hide()
	
	
	if time == 150:
		K.show()
	if time == 180:
		MouseTemp.show()
		squaak.play()
	if time == 210:
		K.texture = K_pressed_text
		note_2.play()
		MouseTemp.hide()
	if time == 225: 
		K.texture = K_text
	if time == 245:
		K.hide()
	############################
	
	#1o rato
	if time == 535:
		MouseTemp.show()
		squeek.play()
	if time >= 565 && time <= 575:
		if Input.is_action_pressed("button_s"):
			if !note_1.playing:
				note_1.play()
				MouseTemp.hide()
				Mouse0.show()
	if time == 575:
		MouseTemp.hide()
	
	#2o rato
	if time == 655:
		MouseTemp.show()
		squaak.play()
	if time >= 680 && time <= 690:
		if Input.is_action_pressed("button_k"):
			if !note_2.playing:
				note_2.play()
				MouseTemp.hide()
				Mouse1.show()
	if time == 685:
		MouseTemp.hide()
	
	#tutorial ######################
	if time == 985:
		S.show()
		K.show()
	if time == 1015:
		MouseTemp.show()
		squeek.play()
	if time == 1045:
		squaak.play()
	
	if time == 1160:
		MouseTemp.hide()
		S.texture = S_pressed_text
		note_1.play()
	if time == 1170:
		S.texture = S_text
		K.texture = K_pressed_text
		note_2.play() 
	if time == 1190:
		S.hide()
		K.hide()
	###############################
	
	#3o rato
	if time == 1500:
		MouseTemp.show()
		squeek.play()
	if time == 1530:
		squaak.play()
	
	if time >= 1630 && time <= 1640:
		if Input.is_action_pressed("button_s"):
			if !note_1.playing:
				note_1.play()
				acerto0 = true
	if time >= 1640 && time <= 1655:
		if Input.is_action_pressed("button_k"):
				if !note_2.playing:
					note_2.play()
					note_1.stop()
					MouseTemp.hide()
				if acerto0:
					Mouse2.show()
	if time == 1455:
		MouseTemp.hide()
		
	time += 1
	pass
	
	
