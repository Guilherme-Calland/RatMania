extends Node2D
onready var randLock = false
onready var randLock2 = false
onready var randLock3 = false
onready var randNum = 0
onready var acerto0 = false
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

#func _ready():
#	pass # Replace with function body.

func firstSequenceGo(firstTutOver,elapsed,score):
	
	var elapsedMod = elapsed % 2000
	if elapsedMod >= 0 && elapsedMod <= 100 && !randLock3:
		counter+=1
		randLock3 = true
	if counter == 2:
		start = true
	if elapsedMod >= 100:
		randLock3 = false
	if firstTutOver && start:
		if elapsedMod >= 0 && elapsedMod <= 100 && !randLock:
			randNum = randi() % 2 #numero randomico 0 ou 1 
			if randNum == 0:
				MouseTemp.show()
				if !squeek.playing:
					squeek.play()
			if randNum == 1:
				MouseTemp.show()
				if !squaak.playing:
					squaak.play()
			randLock = true
		if elapsedMod >= 1000 && elapsedMod <= 1200:
			if randNum == 0:
				if Input.is_action_pressed("button_s"):
					if !E.playing:
						E.play()
						MouseTemp.hide()
						score += 1
						rat_storage.spawn_at_zone()
						acerto0 = true
			elif randNum == 1:
				if Input.is_action_pressed("button_k"):
					if !A.playing:
						A.play()
						MouseTemp.hide()
						score += 1
						rat_storage.spawn_at_zone()
						acerto0 = true
		if elapsedMod  >= 1200 && elapsedMod <= 1300:
			MouseTemp.hide()
			if !acerto0 && !randLock2:
				rat_storage.destroy_rat()
				score -= 1
				randLock2 = true
		if elapsedMod >= 1300 && elapsedMod <= 1400:
			acerto0 = false
			randLock = false
			randLock2 = false
	return score
