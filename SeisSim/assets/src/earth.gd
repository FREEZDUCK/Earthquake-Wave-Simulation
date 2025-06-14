extends Node2D

var layer_path = preload("res://assets/objects/layer.tscn")

func _ready():
	for i in range(len(Info.layerName_list)):
		var layer = layer_path.instantiate()
		layer.radius = Info.layerDepth_list[i]
		layer.color = Info.layerColor_list[i]
		layer.z_index = -i
		add_child(layer)
