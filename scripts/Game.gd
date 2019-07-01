extends Node2D

#velocidade
var speed = 2
#pontuacao
var score = 1
#volume
var volume = -10

onready var rat_storage = self.get_node("RatStorage")
onready var MouseTemp = $Mouse/MouseTemp/MouseTemp
onready var squeek = $Mouse/MouseTemp/Squeek
onready var squaak = $Mouse/MouseTemp/Squaak

onready var flute_song = $FluteSong/FluteSong100
onready var A = $FluteSong/A
onready var B = $FluteSong/B
onready var D = $FluteSong/D
onready var E = $FluteSong/E
onready var Fs = $"FluteSong/F#"
onready var Gs = $"FluteSong/G#"
onready var Flow = $FluteSong/Flow
onready var Elow = $FluteSong/Elow
onready var Tutorial = $Tutorial
onready var Scenary = $Scenary
onready var Flute = $Flute
onready var FluteSong = $FluteSong
onready var Score = $Score

var time_start = 0
var elapsed = 0
var acerto0 = false
var acerto1 = false
var firstTutOver = false
var randNum = 0
var randLock = false
var randLock2 = false

func _ready():
	set_process(true)
	time_start = OS.get_ticks_msec() + 100
	flute_song.play()
	
	#funcao que seta o volume de todos os nódulos de audio
	#cuidado se voce estiver com fone, volume > 0 é bem alto.
	$FluteSong.set_global_volume(volume)

func _process(delta):
	var time_now = OS.get_ticks_msec()
	if !flute_song.playing:
		flute_song.play()
		time_start = time_now + 100
	#quando a musica recomeça reinicia o contador
	elapsed = time_now - time_start
	
	Scenary.scenaryRoll(speed)
	Score.setScore(score)
	Flute.fluteMovement(elapsed)

	if !firstTutOver:
		#firstTutOver faz com que o tutorial rode apenas uma vez
		firstTutOver = Tutorial.first_tutorial(elapsed)

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
				if score <= 0:
					flute_song.stop()
					get_tree().change_scene("res://scenes/GameOver.tscn")
		if elapsedMod >= 1800 && elapsedMod <= 1900:
			acerto0 = false
			randLock = false
			randLock2 = false
