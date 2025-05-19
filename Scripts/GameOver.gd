extends Control

@onready var puntuacions: Label = $ColorRect/VBoxContainer/Puntuacions

func _ready() -> void:
	puntuacions.text = "Puntuació: %d\nPuntuació màxima: %d" % [Global.puntuacio_actual, Global.puntuacio_max]

func _on_comença_pressed() -> void:
	get_tree().change_scene_to_packed(Global.escena_joc)


func _on_surt_pressed() -> void:
	get_tree().quit()
