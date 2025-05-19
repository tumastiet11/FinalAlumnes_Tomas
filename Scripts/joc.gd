extends Node2D

var nombre_maxim := 30

@onready var camera: Camera2D = $Nau/Camera2D

func _ready() -> void:
	randomize()
	Global.Bales = $Bales
	Global.Explosions = $Explosions
	Global.Meteorits = $Meteorits
	Global.Nau = $Nau
	Global.Marcador = $Marcador
	Global.PowerUPs = $PowerUPs
	crea_meteorits()

func crea_meteorits() -> void:
	var nombre_meteorits = Global.Meteorits.get_child_count()
	while nombre_meteorits <= nombre_maxim:
		var nou_meteorit = Global.escena_meteorit.instantiate()
		nou_meteorit.global_position = genera_posicio()
		Global.Meteorits.add_child(nou_meteorit)
		nombre_meteorits += 1

func genera_posicio() -> Vector2:
	var pos = Vector2()

	# Generem una posició aleatòria pel meteorit en un entorn d'una pantalla a dreta i esquerra de l'actual
	var rect = get_viewport().get_visible_rect()
	var camera_centre = Global.Nau.global_position
	pos = camera_centre
	while rect.has_point(pos - camera_centre + rect.size/2.0):
		var max_x = camera_centre.x + 1.5 * rect.size.x
		var min_x = camera_centre.x - 1.5 * rect.size.x
		var max_y = camera_centre.y + 1.5 * rect.size.y
		var min_y = camera_centre.y - 1.5 * rect.size.y
		pos.x = randf_range(min_x, max_x)
		pos.y = randf_range(min_y, max_y)
		
	return pos


func _on_timer_nou_meteorit_timeout() -> void:
	nombre_maxim += 1
	crea_meteorits()
