extends Control

var blink = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("action3"):
		blink = 0
		therapy_time()

func therapy_time():
	blink += 1
	$ColorRect.visible = true
	$ShaderTimer.start()
	

func _on_shader_timer_timeout() -> void:
	$ShaderTimer.stop()
	$ColorRect.visible = false
	$UnshaderTimer.start()

func _on_unshader_timer_timeout() -> void:
	$UnshaderTimer.stop()
	if blink < 2:
		therapy_time()

func show_flufftext():
	$Flufftext.visible = true

func hide_flufftext():
	$Flufftext.visible = false

func show_therapy_text():
	$Black.visible = true
	$Terapeutka.visible = true

func hide_therapy_text():
	$Black.visible = false
	$Terapeutka.visible = false
