extends Node2D

@export var destination_x: int = 100
@export var destination_y: int = 100

func set_destination(x,y):
	destination_x = x
	destination_y = y


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_parent().get_parent().get_parent().teleport_player(destination_x, destination_y)
		
