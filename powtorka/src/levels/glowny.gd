extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hide_hatches():
	$Wlaz1.visible = false
	$Wlaz2.visible = false

func show_hatch1():
	$Wlaz1.visible = true

func show_hatch2():
	$Wlaz2.visible = true

func _on_kapsula_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") && get_parent().rzep.glued == true:
		memory1()

func memory1():
	get_parent().ui.blink = 0
	get_parent().ui.kszksz()
	$Timer.start()
	# wstawić odtwarzanie dźwięku
	$"Lampka sprawdzająca właz2/Sprite2D".texture = load("res://asstes/graphics/mapa/lamkaz.png")

func _on_timer_timeout() -> void:
	$Timer.stop()
	get_parent().ui.blink = 0
	get_parent().ui.kszksz()
	get_parent().timer.start(3.0)
	get_parent().ui.show_therapy_text(get_parent().terapeutka_tekst[1])
	get_parent().start_loop2()


func _on_chair_place_body_entered(body: Node2D) -> void:
	print(body)
	if body.is_in_group("player"):
		get_parent().chair_in_place = true
		print(get_parent().chair_in_place)
