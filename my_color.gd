
extends Node2D

# member variables here, example:
# var a=2
var colores = {
"azul":Color("1b1ecd"),
"rojo":Color("ee1a32"),
"verde":Color("2fee1a"),
"amarillo":Color("f3d017"),
"cafe":Color("3a0101")
}
var color
var llave_color
var rect = Rect2(0,0,100,100)

func _ready():
	var tam_arreglo = int(colores.values().size())
	randomize()
	var aleatorio = randi()%tam_arreglo
	print(aleatorio)
	print(randi())
	color = colores.values()[aleatorio]
	llave_color = colores.keys()[aleatorio]
	set_process_input(true)
	update()

func _input(event):
	if(event.is_action_pressed("reset")):
		var tam_arreglo = int(colores.values().size())
		randomize()
		var aleatorio = randi()%tam_arreglo
		print(aleatorio)
		color = colores.values()[aleatorio]
		update()


func _draw():
	draw_rect(rect,color)
	pass