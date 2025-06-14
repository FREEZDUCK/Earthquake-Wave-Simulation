extends Node2D

var p_wave_path = preload("res://assets/objects/p_wave.tscn")
var s_wave_path = preload("res://assets/objects/s_wave.tscn")

func _ready():
	pass

func spawn_projectiles():
	var num_projectiles = 150
	var angle_step = 360.0 / num_projectiles
	for i in range(num_projectiles):
		var angle_deg = i * angle_step
		var angle_rad = deg_to_rad(angle_deg)
		
		# 생성 위치 (중심에서 spawn_radius만큼 떨어진 위치)
		var spawn_pos = Vector2(cos(angle_rad), sin(angle_rad)) * 1 + Info.focus_pos
		var dir = spawn_pos.direction_to(Info.focus_pos).normalized()
		# 인스턴스 생성 및 위치 설정
		var p_wave = preload("res://assets/objects/p_wave.tscn").instantiate()
		var s_wave = preload("res://assets/objects/s_wave.tscn").instantiate()
		p_wave.global_position = spawn_pos
		p_wave.dir = dir
		s_wave.global_position = spawn_pos
		s_wave.dir = dir
		$wave_container.add_child(p_wave)
		$wave_container.add_child(s_wave)


func _process(delta):
	
	Info.mouse_pos = get_global_mouse_position()
	
	if Input.is_action_just_pressed("L_click"):
		spawn_projectiles()
		
	for wave in find_child("wave_container").get_children():
		if wave.distance_of_center > Info.earthRadius + 1:
			wave.queue_free()
