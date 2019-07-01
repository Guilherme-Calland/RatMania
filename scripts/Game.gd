extends Node2D

#velocidade
var speed = 2
#pontuacao
var score = 1
#volume
var volume = -10

onready var rat_storage = self.get_node("RatStorage")
onready var MouseTemp = get_node("Mouse/MouseTemp/MouseTemp")
onready var squeek = get_node("Mouse/MouseTemp/Squeek")
onready var squaak = get_node("Mouse/MouseTemp/Squaak")

onready var flute_song = get_node("FluteSong/FluteSong100")
onready var A = get_node("FluteSong/A")
onready var B = get_node("FluteSong/B")
onready var D = get_node("FluteSong/D")
onready var E = get_node("FluteSong/E")
onready var Fs = get_node("FluteSong/F#")
onready var Gs = get_node("FluteSong/G#")
onready var Flow = get_node("FluteSong/Flow")
onready var Elow = get_node("FluteSong/Elow")
onready var Tutorial = get_node("Tutorial")
onready var Scenary = get_node("Scenary")
onready var Flute = get_node("Flute")
onready var FluteSong = get_node("FluteSong")
onready var Score = get_node("Score")
onready var FirstSequence = get_node("FirstSequence")
onready var S = get_node("Keys/S")
onready var K = get_node("Keys/K")

export (NodePath) var button_path
onready var button = get_node(button_path)

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
	if firstTutOver:
		score = FirstSequence.firstSequenceGo(firstTutOver, elapsed, score)