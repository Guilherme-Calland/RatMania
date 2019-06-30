extends Node2D

const rat = preload("res://scenes/Mouse.tscn")

onready var storage_zone_01= get_node("StorageZone_1")

var positionInArea = Vector2(0, 0)

func spawn_at_zone():
#	Could be used in case to very how many rats are already on scene
#	var first_zone_length = storage_zone_01.get_child_count()

	var size = storage_zone_01.shape.extents * 2
	
	var rand_width = randi() % int(size[0]+1)
	var rand_height = randi() % int(size[1]+1)
	
	positionInArea.x = rand_width - int(size[0]/2)
	positionInArea.y = rand_height - int(size[1]/2)
	
	var new_rat = rat.instance()
	new_rat.position = positionInArea
	storage_zone_01.add_child(new_rat)

func destroy_rat():
	var front_rat = storage_zone_01.get_children().front()
	if front_rat:
		front_rat.queue_free()