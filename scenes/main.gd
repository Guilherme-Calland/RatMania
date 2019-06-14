extends Node


func _ready():
	set_process(true)
	pass 


var time = 0
var speed = 1
func _process(delta):
	var flauta_text_1 = preload("res://SPRITES/FLAUTA/FLAUTA 1.png")
	var flauta_text_2 = preload("res://SPRITES/FLAUTA/FLAUTA 2.png")
	var flauta_sprite = get_node("Corpo")
	if time == 100:
		time = 0
	if time == 0:
		flauta_sprite.texture = flauta_text_1
	if time == 50:
		flauta_sprite.texture = flauta_text_2
	time = time + speed
	pass
	
