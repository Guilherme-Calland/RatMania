extends Node2D
onready var randLock = false
onready var randLock2 = false
onready var randLock3 = false
onready var randLock4 = false
onready var randNum = 0
onready var randNum2 = 0
onready var acerto0 = false
onready var acerto1 = false
onready var start = false
onready var counter = 0

onready var Flute = get_node("../Flute")
onready var FluteSong = get_node("../FluteSong")
onready var Score = get_node("../Score")
onready var FirstSequence = get_node("../FirstSequence")
onready var S = get_node("../Keys/S")
onready var K = get_node("../Keys/K")
onready var A = get_node("../FluteSong/A")
onready var E = get_node("../FluteSong/E")
onready var rat_storage = get_node("../RatStorage")
onready var MouseTemp = get_node("../Mouse/MouseTemp/MouseTemp")
onready var squeek = get_node("../Mouse/MouseTemp/Squeek")
onready var squaak = get_node("../Mouse/MouseTemp/Squaak")
onready var sound0 = squeek
onready var sound1 = squaak

func secondSequenceGo(elapsed, score):
	
	var elapsedMod = elapsed % 4000
	if elapsedMod >= 0 && elapsedMod <= 100 && !randLock:
		randLock = true
		var randNum = randi()%2 #numero randomico 0 ou 1
		if randNum == 0:
			sound0 = squeek
			MouseTemp.show()
			if !squeek.playing:
				squeek.play()
		if randNum == 1:
			sound0 = squaak
			MouseTemp.show()
			if !squaak.playing:
				squaak.play()
	if elapsedMod >= 100 && elapsedMod <= 200:
		randLock = false
	if elapsedMod >= 500 && elapsedMod <= 600 && !randLock:
		randLock = true
		var randNum = randi()%2 #numero randomico 0 ou 1
		if randNum == 0:
			sound1 = squeek
			if !squeek.playing:
				squeek.play()
		if randNum == 1:
			sound1 = squaak
			if !squaak.playing:
				squaak.play()
	if elapsedMod >= 600 && elapsedMod <= 700:
		randLock = false 
	if elapsedMod >= 2000 && elapsedMod <= 2200:
		if sound0 == squeek:
			if Input.is_action_pressed("button_s"):
				if !E.playing:
					E.play()
					acerto0 = true
		elif sound0 == squaak:
			if Input.is_action_pressed("button_k"):
				if !A.playing:
					A.play()
					acerto0 = true
	if elapsedMod >= 2500 && elapsedMod <= 2700:
		if sound1 == squeek:
			if Input.is_action_pressed("button_s"):
				if !E.playing:
					E.play()
					acerto1 = true
		elif sound1 == squaak:
			if Input.is_action_pressed("button_k"):
				if !A.playing:
					A.play()
					acerto1 = true
	if elapsedMod  >= 2700 && elapsedMod <= 2800:
		MouseTemp.hide()
		if !randLock:
			randLock = true
			if acerto0 && acerto1:
				score += 1
				rat_storage.spawn_at_zone()
				MouseTemp.hide()
			elif !(acerto0 && acerto1):
				rat_storage.destroy_rat()
				score -= 1
	if elapsedMod >= 3800 && elapsedMod <= 3900:
		acerto0 = false
		acerto1 = false
		randLock = false
		randLock3 = false
	return score

func finnished2(elapsed):
	var elapsedMod = elapsed%4000
	if elapsedMod >= 0 && elapsedMod <= 100:
		return true
	else:
		return false