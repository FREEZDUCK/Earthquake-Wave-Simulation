extends Node

# 반지름(r)에 따른 밀도 값
func get_density(r: float) -> float:
	if r < 1221.5:
		return 13.0885 - 8.8381 * pow(r / 6371.0, 2)
	elif r < 3480.0:
		var x = r / 6371.0
		return 12.5815 - 1.2638 * x - 3.6426 * pow(x, 2) - 5.5281 * pow(x, 3)
	elif r < 5701.0:
		var x = r / 6371.0
		return 7.9565 - 6.4761 * x + 5.5283 * pow(x, 2) - 3.0807 * pow(x, 3)
	elif r < 5771.0:
		return 5.3197 - 1.4836 * (r / 6371.0)
	elif r < 5971.0:
		return 11.2494 - 8.0298 * (r / 6371.0)
	elif r < 6151.0:
		return 7.1089 - 3.8045 * (r / 6371.0)
	elif r < 6346.6:
		return 2.6910 + 0.6924 * (r / 6371.0)
	elif r < 6356.0:
		return 2.900
	elif r < 6368.0:
		return 2.600
	else:  # 6291.0 ≤ r ≤ 6371.0
		return 1.020

# 지구 깊이에 따른 체적 탄성 계수 k 반환 함수 (단위: Pa)
func get_bulk_modulus_k(depth_km: float) -> float:
	if depth_km < 35.0:
		return 5.25e10  # 지각 평균: 52.5 GPa
	elif depth_km < 660.0:
		return 1.45e11  # 상부 맨틀 평균: 145 GPa
	elif depth_km < 2890.0:
		return 2.35e11  # 하부 맨틀 평균: 235 GPa
	elif depth_km < 5150.0:
		return 1.4e11   # 외핵 평균: 140 GPa
	elif depth_km <= 6371.0:
		return 1.5e12   # 내핵 평균: 1500 GPa
	else:
		push_error("깊이는 0 ~ 6371 km 범위여야 합니다.")
		return -1.0
# 지구 깊이에 따른 전단 탄성 계수 u 반환 함수 (단위: Pa)
func get_shear_modulus_u(depth_km: float) -> float:
	if depth_km < 35.0:
		return 3.0e10  # 지각 평균: 30 GPa
	elif depth_km < 660.0:
		return 7.0e10  # 상부 맨틀 평균: 70 GPa
	elif depth_km < 2890.0:
		return 1.15e11  # 하부 맨틀 평균: 115 GPa
	elif depth_km < 5150.0:
		return 0.0      # 외핵: 액체이므로 전단 계수 없음
	elif depth_km <= 6371.0:
		return 1.6e11   # 내핵 평균: 160 GPa
	else:
		push_error("깊이는 0 ~ 6371 km 범위여야 합니다.")
		return -1.0
#
#func get_angle_of_incidence(v1 : Vector2, v2 : Vector2):
	#var angle_rad = acos(v1.normalized().dot(v2.normalized()))
	#var angle_deg = rad_to_deg(angle_rad)
	#return angle_deg
#
#func get_refractive_index(v):
	#return 3.0e8 / v
#
#func get_refraction_angle(n1: float, n2: float, angle_i_deg: float) -> float:
	#var angle_i_rad = deg_to_rad(angle_i_deg)
	#var sin_i = sin(angle_i_rad)
	#var ratio = n1 / n2
	#var sin_j = ratio * sin_i
#
	## 전반사 체크 (sin_j > 1이면 굴절 없음)
	#if abs(sin_j) > 1.0:
		#return -1.0  # 전반사 발생
#
	#var angle_j_rad = asin(sin_j)
	#return rad_to_deg(angle_j_rad)

