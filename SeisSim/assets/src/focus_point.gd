extends Node2D

func get_earthOutline_pos():
	var dir = Info.mouse_pos.normalized()
	var closest_point = dir * Info.earthRadius
	
	return closest_point

func _process(delta):
	global_position = get_earthOutline_pos()
	Info.focus_pos = global_position
