extends CharacterBody2D


@onready var animation: AnimatedSprite2D = $animation

const SPEED = 300.0
const START_POSITION_X: int = 100
const START_POSITION_Y: int = 100
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _physics_process(delta: float) -> void:
	movement()
	if velocity.y != 0 or velocity.x != 0 :
		if $AudioStreamPlayer.playing == false:
			$AudioStreamPlayer.play()
		

func movement():
	if Input.is_action_pressed("up"):
		velocity.y = -SPEED
		animation.play("move_up")
	elif Input.is_action_pressed("down"):
		velocity.y = SPEED
		animation.play("move_down")
	else: 
		velocity.y = 0
	
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		animation.play("move_right")
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		animation.play("move_left")
	else:
		velocity.x = 0
	
	if velocity == Vector2(0, 0):
		animation.play("default")
	move_and_slide()
	if velocity.x != 0:
		pass


func reset_position():
	global_position.x = START_POSITION_X
	global_position.y = START_POSITION_Y
	
