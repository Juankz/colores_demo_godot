
extends Timer

# member variables here, example:
# var a=2
var cuadro=preload("res://Mi_color.tscn") #Un cuadro es una escena, así que hay que cargar la escena primero
var arreglo_de_cuadros = [] #Aquí guardamos los que estan en pantalla
var cuadros_a_eliminar = []
var ancho_pantalla
var altura_pantalla

func _ready():
#	set_wait_time(2)
	ancho_pantalla = OS.get_window_size().width
	altura_pantalla = OS.get_window_size().height 
	set_process(false) #El como hereda de Timer está constantemente llamando a la función _process asi que aunque lo deje como falso, lo va a procesar

func _process(delta):
	for cuadro in arreglo_de_cuadros :
		#Mueve los cuadros hacia abajo
		var pos = cuadro.get_pos()
		pos.y += 100*delta
		cuadro.set_pos(pos)

func _on_Semilla_timeout():
	print("nuevo cuadro")
	var nuevo_cuadro = cuadro.instance() #Aquí creamos un nuevo obejto pero no aún no aparece en pantalla
	var pos = rand_range(0,ancho_pantalla - nuevo_cuadro.rect.size.x) #Lo psocionamos en un punto aleatorio de la pantalla
	nuevo_cuadro.set_pos(Vector2(pos,-nuevo_cuadro.rect.size.y))
	arreglo_de_cuadros.push_back(nuevo_cuadro) #Anexa el nuevo cuadro al final del arreglo
	add_child(nuevo_cuadro) #Aquí lo añadimos como hijo a este nodo. En este momento empieza a hacer parte de la escena y se puede ver en pantalla


func _on_Entrada_texto_capturado(texto): #Conecta una señal que nos envía la intefaz de usuario
	for cuadro in arreglo_de_cuadros:
		if(texto == cuadro.llave_color): #compara si la palabra que entra coincide con el color del cuadro
			cuadros_a_eliminar.push_back(cuadro) #No eliminamos el cuadro directamente porque afectaría el cilo FOR así que lo guardamos en otro arreglo para eliminarlo después
	#Ahora si eliminamos los cuadros correspondientes
	for cuadro in cuadros_a_eliminar:
		arreglo_de_cuadros.erase(cuadro) #Eliminamos el cuadro del arreglo original
		cuadro.queue_free() #Eliminamos el objeto
	cuadros_a_eliminar.clear() #Limpiamos el arreglo donde se eliminan los cuadros así no se vuelven a llamar objetos que no existen