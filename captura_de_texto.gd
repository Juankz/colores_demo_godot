
extends LineEdit

var captura
var salida
signal texto_capturado #declara una señal que se va a conectar, esta se puede ver en el editor en el panel "Nodo" junto con las demás señales

func _ready():
	salida = get_node("Salida")
	set_process_input(true)


func _input(event):
	captura = get_text()
	salida.set_text(captura) #Actualiza la salida (Etiqueta/Label) cada vez que un evento de entrada ocurre ej: oprimir un tecla o un botón del mouse
	if(event.is_action_pressed("capturar_entrada")): #Esta señal está definida en Escena >> Configuración del proyecto >> mapa de entradas
		set_text("") #Limpia el texto del cuadro
		emit_signal("texto_capturado",captura) #Emite una señal dando a entender que el texto ha sido capturado, envía el texto como parámetro

