extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		memory2()

func memory2():
	get_parent().ui.blink = 0
	get_parent().ui.kszksz()
	$Timer.start()
	# wstawić dźwięk

func _on_timer_timeout() -> void:
	$Timer.stop()
	get_parent().ui.blink = 0
	get_parent().ui.kszksz()
	get_parent().timer.start(3.0)
	get_parent().ui.show_therapy_text(get_parent().terapeutka_tekst[2])
	get_parent().start_loop2()
