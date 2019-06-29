extends Node2D

#velocidade
var speed = 2
#pontuacao
var score = 0

onready var MouseTemp = $Mouse/MouseTemp/MouseTemp
onready var squeek = $Mouse/MouseTemp/Squeek
onready var squaak = $Mouse/MouseTemp/Squaak

onready var flute_song = $FluteSong/FluteSong100
onready var A = $FluteSong/A
onready var B = $FluteSong/B
onready var Cs = $"FluteSong/C#"
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
onready var Mouse = $Mouse

var time_start = 0
var elapsed = 0
var acerto0 = false
var acerto1 = false
var firstTutOver = false
var randNum = 0
var randLock = false

func _ready():
	set_process(true)
	time_start = OS.get_ticks_msec() + 100
	flute_song.play()
	
	#funcao que seta o volume de todos os nódulos de audio
	#cuidado se voce estiver com fone, volume > 0 é bem alto.
	$FluteSong.set_global_volume(-10)

func _process(delta):
	var time_now = OS.get_ticks_msec()
	
	if !flute_song.playing:
		flute_song.play()
		time_start = time_now + 100
	#quando a musica recomeça reinicia o contador
	
	elapsed = time_now - time_start
	
	print(elapsed)
	Scenary.scenaryRoll(speed)
	Flute.fluteMovement(elapsed)
	Mouse.mouseMovement(elapsed)
	
	if !firstTutOver:
		#firstTutOver faz com que o tutorial rode apenas uma vez
		firstTutOver = Tutorial.first_tutorial(elapsed)
	
	if firstTutOver:
		if score <= 10:
			var elapsedMod = elapsed%2000
			if elapsedMod >= 1000 && elapsedMod <= 1100 && !randLock:
				randNum = randi()%2+0 #numero randomico 0 ou 1 
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
							Mouse.getMouse(score).show()
							score += 1
				elif randNum == 1:
					if Input.is_action_pressed("button_k"):
						if !A.playing:
							A.play()
							MouseTemp.hide()
							Mouse.getMouse(score).show()
							score += 1
			if elapsedMod  >= 1700 && elapsedMod <= 1800:
				MouseTemp.hide()
				randLock = false
				
					
			
	
