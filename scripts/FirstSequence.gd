extends Node2D
onready var randLock = false
onready var randLock2 = false
onready var randNum = 0
onready var MouseTemp = get_tree().get_root().get_node("Game").find_node("MouseTemp")
onready var squeek = $".."/Mouse/MouseTemp/Squeek
onready var squaak = $".."/Mouse/MouseTemp/Squaak
onready var A = $".."/FluteSong/A
onready var E = $".."/FluteSong/E
onready var rat_storage = self.get_node("RatStorage")
onready var acerto0 = false

#func _ready():
#	pass # Replace with function body.

func firstSequenceGo(firstTutOver,elapsed,score):
	if firstTutOver:
		var elapsedMod = elapsed % 2000
		if elapsedMod >= 1000 && elapsedMod <= 1100 && !randLock:
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
		if elapsedMod >= 1400 && elapsedMod <= 1700:
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
		if elapsedMod  >= 1700 && elapsedMod <= 1800:
			MouseTemp.hide()
			if !acerto0 && !randLock2:
				rat_storage.destroy_rat()
				score -= 1
				randLock2 = true
		if elapsedMod >= 1800 && elapsedMod <= 1900:
			acerto0 = false
			randLock = false
			randLock2 = false
			return score
