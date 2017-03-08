
extends Timer

# member variables here, example:
# var a=2
var cuadro=preload("res://Mi_color.tscn")
var arreglo_de_cuadros = []
var cuadros_a_eliminar = []
var ancho_pantalla
var altura_pantalla

func _ready():
#	set_wait_time(2)
	ancho_pantalla = OS.get_window_size().width
	altura_pantalla = OS.get_window_size().height 
	set_process(false) #El nodo está constantemente llamando a la función _process

func _process(delta):
	for cuadro in arreglo_de_cuadros :
		var pos = cuadro.get_pos()
		pos.y += 100*delta
		cuadro.set_pos(pos)

func _on_Semilla_timeout():
	print("nuevo cuadro")
	var nuevo_cuadro = cuadro.instance()
	var pos = rand_range(0,ancho_pantalla)
	nuevo_cuadro.set_pos(Vector2(pos,-nuevo_cuadro.rect.size.y))
	arreglo_de_cuadros.push_back(nuevo_cuadro)
	add_child(nuevo_cuadro)


func _on_Entrada_texto_capturado(texto):
	for cuadro in arreglo_de_cuadros:
		if(texto == cuadro.llave_color):
			cuadros_a_eliminar.push_back(cuadro)
	for cuadro in cuadros_a_eliminar:
		arreglo_de_cuadros.erase(cuadro)
		cuadro.queue_free()
	cuadros_a_eliminar.clear()