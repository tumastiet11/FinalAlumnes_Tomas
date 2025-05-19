extends Node

var Bales: Node2D
var Explosions: Node2D
var Marcador: CanvasLayer
var Meteorits: Node2D
var Nau: CharacterBody2D
var PowerUPs: Node2D

var puntuacio_max := 0
var puntuacio_actual := 0

var escena_explosio: PackedScene = preload("res://Escenes/explosió.tscn")
var escena_meteorit: PackedScene = preload("res://Escenes/meteorit.tscn")
var escena_joc: PackedScene = preload("res://Escenes/joc.tscn")
var escena_game_over: PackedScene = preload("res://Escenes/game_over.tscn")

var escena_powerup_bomba: PackedScene = preload("res://Escenes/power_up_bomba.tscn")
var escena_powerup_vida: PackedScene = preload("res://Escenes/power_up_vida.tscn")

var PUNTMAXFILEPATH : StringName = "user://PuntuacioMax.txt"
