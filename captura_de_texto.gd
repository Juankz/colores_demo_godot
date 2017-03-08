
extends LineEdit

var captura
var salida
signal texto_capturado

func _ready():
	salida = get_node("Salida")
	add_user_signal("entra_texto")
	set_process_input(true)

func _input(event):
	captura = get_text()
	salida.set_text(captura)
	if(event.is_action_pressed("capturar_entrada")):
		set_text("")
		emit_signal("texto_capturado",captura)

