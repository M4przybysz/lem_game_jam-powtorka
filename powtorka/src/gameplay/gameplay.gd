extends Node2D

@onready var player: CharacterBody2D = $Player

var loop_count: int = 0
var player_holds_item: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("action2"):
		reset_loop()

func reset_loop():
		loop_count += 1
		player.reset_position()
		$Kubeczek.reset_position()
		$Krzeslo4.reset_position()
		$PlakietkaIDEwy.reset_position()

func teleport_player(x: int, y: int):
	player.global_position.x = x
	player.global_position.y = y
