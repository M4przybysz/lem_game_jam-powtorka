extends Control

var blink = 0
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
