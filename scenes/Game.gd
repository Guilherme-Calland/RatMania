extends Node2D

#tempo
var time = 0
#velocidade
var speed = 2
#pontuacao
var score = 0

#ratos
onready var MouseTemp = $Mouse/MouseTemp/MouseTemp
onready var Mouse0 = $Mouse/Mouse0/Mouse0
onready var Mouse1 = $Mouse/Mouse1/Mouse1

 
onready var squeek = $Mouse/MouseTemp/Squeek
onready var squaak = $Mouse/MouseTemp/Squaak

onready var flute_song100 = $FluteSong/FluteSong100
onready var flute_song120 = $FluteSong/FluteSong120
onready var flute_song140 = $FluteSong/FluteSong140
onready var flute_song200 = $FluteSong/FluteSong200

onready var acerto1 = false
onready var acerto2 = false

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
			if !squeek.playing:
				squeek.play()
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
			if !squaak.playing:
				squaak.play()
				MouseTemp.hide()
				Mouse1.show()
				score += 1
	if time == 210: 
		MouseTemp.hide()
		
	time += 1
	pass
	
	
