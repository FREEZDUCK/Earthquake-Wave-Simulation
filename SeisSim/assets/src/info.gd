extends Node

var earthRadius : float = 6371.0
var layerName_list = ["내핵", "외핵", "하부 맨틀", "상부 맨틀", "지각"]
var layerDepth_list = [1221.5, 3480, 5701, 6346.6, 6371.0]
var layerColor_list = [Color("#FFFFFF"), Color("#E5AF4B"), Color("#E2B593"), Color("#995B41"), Color("#6D2923")]

var mouse_pos : Vector2
var focus_pos : Vector2

var marker_delay := 0.1

var full_screen := false
func _process(delta):
	if Input.is_action_just_pressed("F"):
		if full_screen:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		full_screen = !full_screen
