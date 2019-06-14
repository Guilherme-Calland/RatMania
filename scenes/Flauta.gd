extends Node2D

#tempo
var time = 0
var mouseCount = 0
var fluteCount = 0
#velocidade
var speed = 2

onready var flute_text_0 = preload("res://SPRITES/FLAUTA/FLAUTA 1.png")
onready var flute_text_1 = preload("res://SPRITES/FLAUTA/FLAUTA 2.png")
onready var Flute = $Flute/Flute
onready var Tile = $Tile/Tile

#ratos
onready var mouse_text_0 = preload("res://SPRITES/RATINHO/RATINHO.png")
onready var mouse_text_1 = preload("res://SPRITES/RATINHO/RATINHO_INCL.png")

onready var Mouse = $Mouse/Mouse/Mouse
onready var Mouse0 = $Mouse/Mouse0/Mouse0
onready var Mouse1 = $Mouse/Mouse1/Mouse1

 
onready var squeek = $Mouse/Mouse/Squeek
onready var squaak = $Mouse/Mouse/Squaak

onready var tile_posx0 = $Tile/Tile.position.x

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
	
	$Background.backgroundRoll()
	mouseCount += 1
	time += 1
	
	#60frames para aparecer o rato
	#som
	if(true):#if mouseCount < 500:
		if  !(flute_song100.playing):
			speed = 2
			flute_song100.play()
			flute_song120.stop()
	elif mouseCount < 1000 :
		if !(flute_song120.playing):
			speed = 3
			flute_song100.stop()
			flute_song140.stop()
			flute_song120.play()
	elif mouseCount < 1500:
		if !(flute_song140.playing):
			speed = 4
			flute_song120.stop()
			flute_song200.stop()
			flute_song140.play()
	else:
		if !(flute_song200.playing):
			speed = 8
			flute_song140.stop()
			flute_song200.play()
		
	
	#Comportamento
	if fluteCount >= 120:
		fluteCount = 0
	if fluteCount < 60:
		Flute.texture = flute_text_0
		Mouse0.texture = mouse_text_0
		Mouse1.texture = mouse_text_1
	else:
		Flute.texture = flute_text_1
		Mouse0.texture = mouse_text_1
		Mouse1.texture = mouse_text_0		
	fluteCount = fluteCount + speed
	
	#Comportamento do Tile
	Tile.position.x -= speed
	if Tile.position.x < tile_posx0 - 640:
		Tile.position.x = tile_posx0 
	
	#Compartamento dos ratos
	if time == 60:
		Mouse.show()
		squeek.play()
	if time >= 85 && time <=95:
		if Input.is_action_pressed("button_s"):
			if !squeek.playing:
				squeek.play()
				Mouse.hide()
				Mouse0.show()
	if time == 95: 
		Mouse.hide()
		
	if time == 180:
		Mouse.show()
		squaak.play()
	if time >= 205 && time <=215:
		if Input.is_action_pressed("button_k"):
			if !squaak.playing:
				squaak.play()
				Mouse.hide()
				Mouse1.show()
	if time == 215: 
		Mouse.hide()
		
		
	
		
		
	
	
	
	pass
	
	
