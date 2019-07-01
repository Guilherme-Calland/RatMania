extends Node2D

onready var flute_song100 = $".."/FluteSong/FluteSong100
onready var A = $".."/FluteSong/A
onready var B = $".."/FluteSong/B
onready var Cs = $".."/"FluteSong/C#"
onready var D = $".."/FluteSong/D
onready var E = $".."/FluteSong/E
onready var Fs = $".."/"FluteSong/F#"
onready var Gs = $".."/"FluteSong/G#"
onready var Flow = $".."/FluteSong/Flow
onready var Elow = $".."/FluteSong/Elow

onready var S = $".."/Keys/S
onready var K = $".."/Keys/K

onready var S_text = preload("res://SPRITES/TECLADO/S.png")
onready var S_pressed_text = preload("res://SPRITES/TECLADO/S_pressed.png")
onready var K_text = preload("res://SPRITES/TECLADO/K.png")
onready var K_pressed_text = preload("res://SPRITES/TECLADO/K_pressed.png")

onready var MouseTemp = $".."/Mouse/MouseTemp/MouseTemp
onready var Mouse0 = $".."/Mouse/Mice/Mouse0
onready var Mouse1 = $".."/Mouse/Mice/Mouse1
onready var Mouse2 = $".."/Mouse/Mice/Mouse2
onready var Mouse3 = $".."/Mouse/Mice/Mouse3

onready var squeek = $".."/Mouse/MouseTemp/Squeek
onready var squaak = $".."/Mouse/MouseTemp/Squaak

func first_tutorial(time):
	if time >= 8500 && time <= 8600:
		S.texture = S_text
		S.show()
	if time >= 9000 && time <= 9100:
		MouseTemp.show()
		if !squeek.playing:
			squeek.play()
#
	if time >= 10000 && time <= 10100:
		S.texture = S_pressed_text
		if !E.playing:
			E.play()
		MouseTemp.hide()
	if time >= 10100 && time <=10200:
		S.texture = S_text
	if time >= 10200 && time <= 10300:
		S.hide()
		
	if time >= 11500 && time <= 11600:
		K.texture = K_text
		K.show()

	if time >= 12000 && time <= 12100:
		MouseTemp.show()
		if !squaak.playing:
			squaak.play()
#
	if time >= 13000 && time <= 13100:
		K.texture = K_pressed_text
		if !A.playing:
			A.play()
		MouseTemp.hide()
	if time >= 13100 && time <=13200:
		K.texture = K_text
	if time >= 13200 && time <= 13300:
		K.hide()
		
	if time >= 15000:
		#retorna que acabou o primeiro tutorial
		return true
#
	
	
