extends Node2D

#velocidade
var speed = 2

#desativar tutorial
var firstTutOver = false
#pontuacao
var score = 1
###########################
#volume
var volume = -10
###########################
var contador = 0

onready var MouseTemp = get_node("Mouse/MouseTemp/MouseTemp")
onready var flute_song = get_node("FluteSong/FluteSong100")
onready var Tutorial = get_node("Tutorial")
onready var Scenary = get_node("Scenary")
onready var Flute = get_node("Flute")
onready var FluteSong = get_node("FluteSong")
onready var Score = get_node("Score")
onready var FirstSequence = get_node("FirstSequence")
onready var SecondSequence = get_node("SecondSequence")
onready var S = get_node("Keys/S")
onready var K = get_node("Keys/K")
onready var randLock = false
onready var randNum = 0


export (NodePath) var button_path
onready var button = get_node(button_path)

var time_start = 0
var elapsed = 0

func _ready():
	set_process(true)
	time_start = OS.get_ticks_msec() + 100
	flute_song.play()
	
	#funcao que seta o volume de todos os nódulos de audio
	#cuidado se voce estiver com fone, volume > 0 é bem alto.
	$FluteSong.set_global_volume(volume)



func _process(delta):
	if button.pressed:
		firstTutOver = true
		button.hide()
		S.hide()
		K.hide()
		MouseTemp.hide()
	
	var time_now = OS.get_ticks_msec()
	if !flute_song.playing:
		flute_song.play()
		time_start = time_now + 100
	#quando a musica recomeça reinicia o contador
	elapsed = time_now - time_start
	
	Scenary.scenaryRoll(speed)
	Score.setScore(score)
	Flute.fluteMovement(elapsed)
		
	if score <= 0:
		flute_song.stop()
		get_tree().change_scene("res://scenes/GameOver.tscn")

	if !firstTutOver:
		#firstTutOver faz com que o tutorial rode apenas uma vez
		firstTutOver = Tutorial.first_tutorial(elapsed,button)
	if score < 10 && firstTutOver:
		score = FirstSequence.firstSequenceGo(firstTutOver, elapsed, score)
	elif score >= 10 && score < 20 :
		score = SecondSequence.secondSequenceGo(elapsed, score)
	elif (score >= 20) :
		if !randLock:
			randNum  = randi()%2
			randLock = true
		match randNum:
			0:
				score = FirstSequence.firstSequenceGo(firstTutOver, elapsed, score)
				if FirstSequence.finnished1(elapsed):
					randLock = false
			1:
				score = SecondSequence.secondSequenceGo(elapsed, score)
				if SecondSequence.finnished2(elapsed):
					randLock = false
	