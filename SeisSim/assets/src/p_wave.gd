extends Node2D

var dir : Vector2

var depth
var distance_of_center = Info.earthRadius

func get_velocity(k, u, p): #k는 체적 u는 전단 계수, p는 밀도
	var vp = ((k + 4/3 * u)/p) ** 1/2
	return vp

func _process(delta):

	distance_of_center = global_position.distance_to(Vector2(0, 0)) #r
	depth = Info.earthRadius - distance_of_center
	var v = get_velocity(Command.get_bulk_modulus_k(depth), Command.get_shear_modulus_u(depth), Command.get_density(distance_of_center)) * 0.0000001
	global_position += dir * v * delta
