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
onready var flute_song120 = $FluteSong/FluteSong120
onready var flute_song140 = $FluteSong/FluteSong140
onready var flute_song200 = $FluteSong/FluteSong200
onready var C = $FluteSong/C
onready var D = $FluteSong/D
onready var E = $FluteSong/E
onready var F = $FluteSong/F
onready var G = $FluteSong/G
onready var A = $FluteSong/A
onready var B = $FluteSong/B
onready var C8 = $FluteSong/C8

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
	
	#Compartamento dos ratos
	if time == 60:
		MouseTemp.show()
		squeek.play()
	if time >= 85 && time <= 95:
		if Input.is_action_pressed("button_s"):
			if !C.playing:
				C.play()
				MouseTemp.hide()
				Mouse0.show()
				score += 1
	if time == 95: 
		MouseTemp.hide()
		
	if time == 175:
		MouseTemp.show()
		squaak.play()
	if time >= 200 && time <=210:
		if Input.is_action_pressed("button_k"):
			if !A.playing:
				A.play()
				MouseTemp.hide()
				Mouse1.show()
				score += 1
	if time == 210: 
		MouseTemp.hide()
		
	if time == 360:
		MouseTemp.show()
		squeek.play()
	if time == 390:
		squaak.play()
	
#	if time == 440:
#		squeek.play()
#	if time == 455:
#		squaak.play()
		
	if time >= 435 && time <= 445:
		if Input.is_action_pressed("button_s"):
			if !E.playing:
				E.play()
				acerto0 = true
	if time >= 445 && time <= 460:
		if Input.is_action_pressed("button_k"):
			if !A.playing:
				E.stop()
				A.play()
				acerto1 = true
				if acerto0 && acerto1:
					MouseTemp.hide()
					Mouse2.show()
					score += 1
	if time == 460: 
		MouseTemp.hide()
		acerto0 = false
		acerto1 = false
		
	time += 1
	
	if score >= 3:
		speed = 2.4
	pass
	
	
