extends Node2D


var show_random_object1: bool = false
var show_random_object2: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$teleports/teleport.set_destination(400,620)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	show_objects()

func show_objects() -> void:
	if get_parent().loop_count >= 1 and get_parent().loop_count <= 3:
		$Objects/Object.visible = true
	else:
		$Objects/Object.visible = false
	
	if show_random_object1 == true:
		$Objects/Object1.visible = true
	else:
		$Objects/Object1.visible = false
	
	if get_parent().loop_count == 2 && show_random_object2 == true:
		$Objects/Object2.visible = true
	else: 
		$Objects/Object2.visible = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		show_random_object1 = true
		if get_parent().loop_count == 0:
			show_random_object2 = true

