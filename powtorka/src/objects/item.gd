extends Node2D

@export var START_POSITION_X: int = 100
@export var START_POSITION_Y: int = 250

var glued = false
var can_pick_up: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_to_player()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("action1"):
		if can_pick_up == true && get_parent().player_holds_item == false:
			glued = true
			can_pick_up = false
			get_parent().player_holds_item = true
			if is_in_group("cup") && get_parent().chair_in_place == true:
				get_parent().glowny.show_hatch1()
		else:
			glued = false
			get_parent().player_holds_item = false

func move_to_player():
	if glued == true:
		global_position.x = get_parent().player.global_position.x
		global_position.y = get_parent().player.global_position.y

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		can_pick_up = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		can_pick_up = false

func reset_position():
	glued = false
	can_pick_up = false
	global_position.x = START_POSITION_X
	global_position.y = START_POSITION_Y
