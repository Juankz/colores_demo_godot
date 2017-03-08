
extends Node2D

# Diccionario con colores
var colores = {
"azul":Color("1b1ecd"),
"rojo":Color("ee1a32"),
"verde":Color("2fee1a"),
"amarillo":Color("f3d017"),
"cafe":Color("3a0101")
}
var color #color actual
var llave_color #texto con el que se identifica el color
var rect = Rect2(0,0,100,100) #Las dimensiones con que se dibujará el cuadro

func _ready():
	var tam_arreglo = int(colores.values().size())
	randomize() #Hay que llamar este étodo siempre antes de llamar randi()
	var aleatorio = randi()%tam_arreglo #Obtiene un numero entero aleatorio entre 0 y el número de colores en el diccionario
	#Imprime nuestro resultado
	print(aleatorio)
	print(randi())
	#Asigna el volor obtenido junto con la llave a su respectiva variable que se llamará desde otro script
	color = colores.values()[aleatorio]
	llave_color = colores.keys()[aleatorio]
	set_process_input(true) #Leemos entradas

func _input(event):
	#Cambia el color si se presiona la tecla espacio
	if(event.is_action_pressed("reset")):
		var tam_arreglo = int(colores.values().size())
		randomize()
		var aleatorio = randi()%tam_arreglo
		print(aleatorio)
		color = colores.values()[aleatorio]
		llave_color = colores.keys()[aleatorio]
		update() #Se llama para que los cambios tomen efecto en el dibujado


func _draw():
	draw_rect(rect,color)
	pass