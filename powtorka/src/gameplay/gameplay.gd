extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var ui: Control = $CanvasLayer/UI
@onready var kubeczek: Node2D = $Kubeczek
@onready var krzeslo_4: Node2D = $Krzeslo4
@onready var plakietka_id_ewy: Node2D = $PlakietkaIDEwy
@onready var rzep: Node2D = $Rzep

@onready var timer: Timer = $CanvasLayer/Timer

var loop_count: int = 0
var player_holds_item: bool = false
var player_holds_adam: bool = true

var terapeutka_tekst = [
	"Czy w takim razie chcesz o tym porozmawiać?", 
	"Rozumiem, że było to dla ciebie trudne. Zacznijmy od początku, może opowiesz mi co wtedy czułeś?",
	"A więc dbałeś o całą załogę, czy chcesz mi opowiedzieć o waszej relacji?",
	"Czego żałujesz najbardziej?", "Więc była ona dla ciebie ważna, co się stało gdy nie zgodziliście się w sprawie nawigacji?",
	"Wydaje mi się, że ona zawsze wierzyła w twoje umiejętności bardziej niż w autopilota",
	"Panie Adamie, słyszałem że pana poprzednia terapia zakończyła się fiaskiem. Teraz ja się panem zajmę."
]
	
var Kapsuła_tekst =[
	"Powinienem był tam z nimi zostać…",
	"Gdybym tylko się jej posłuchał…",
	"Nie tak powinny wyglądać jej ostatnie chwile…"
]

var	sypialnia_tekst = [
	"Nie wiem po co jeszcze biorę te leki…",
	"Nic mi nie pomagają…",
	"Może znowu pójdę spać…"
]	

var salon_tekst = [
	"Wtedy była moja warta, musiałem upewnić się, że jesteśmy bezpieczni.",
	"Wtedy poszedłem napić się kawy."
]
	
var kuchnia_tekst = [
	"Nie chciałem się z nią kłócić…",
	"Nie chciałem rozbić kubka od niej…",
	"Nie powinienem był tak wtedy na nią krzyczeć…"
]
	
var kokpit_tekst = [
	"Nigdy więcej nie pójdę z kimś na piwo…",
	"Od tamtej pory już nigdy nie usiadłem za sterem.",
	"Nie powinienem był ufać autopilotowi…"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_story()

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
		$Rzep.reset_position()


func teleport_player(x: int, y: int):
	player.global_position.x = x
	player.global_position.y = y


func start_story():
	$Kubeczek.visible = false
	$Krzeslo4.visible = false
	$PlakietkaIDEwy.visible = false
	$Glowny.hide_hatches()
	ui.show_therapy_text(terapeutka_tekst[0])
	timer.start()


func _on_timer_timeout() -> void:
	ui.hide_therapy_text()
	ui.hide_flufftext()
	timer.stop()
