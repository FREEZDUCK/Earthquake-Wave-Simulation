extends Node2D

var radius
var color

func _draw():
	draw_circle(Vector2(0, 0), radius, color)
