extends CharacterBody2D

@export var escena_laser: PackedScene 

var acceleracio := Vector2.ZERO
var accel_max := 200
var bombes := 3 :
	set(noves_bombes):
		if 0 <= noves_bombes and noves_bombes <= 3:
			bombes = noves_bombes
		Global.Marcador.canvi_bombes(bombes)

var frenada := 20
var meteorits_morts: int = 0
var vida_maxima := 100
@export var vida: float = vida_maxima :
	set(nova_vida):
		if nova_vida < vida:
			animacions.play("hit")
		elif vida< 0:
			get_tree().change_scene_to_file("res://Escenes/game_over.tscn")
		
		else:
			animacions.play("cura")
		vida = nova_vida
		barra_vida.actualitza(vida)
var vel_max: float = 300
var vel_rotacio: float = 0
var vel_rotacio_max: float = 200
var pot_disparar: bool = true

@onready var area_bomba: Area2D = $AreaBomba
@onready var forma_area_bomba: CollisionShape2D = $AreaBomba/FormaAreaBomba
@onready var Estela: GPUParticles2D = $Estela
@onready var so_motor: AudioStreamPlayer2D = $SoMotor
@onready var centre: Marker2D = $Centre
@onready var so_laser: AudioStreamPlayer2D = $SoLaser
@onready var dreta: Marker2D = $Dreta
@onready var esquerra: Marker2D = $Esquerra
@onready var animacions: AnimationPlayer = $Animacions
@onready var barra_vida: TextureProgressBar = $Centre/BarraVida
@onready var so_bomba: AudioStreamPlayer2D = $SoBomba

func _physics_process(delta: float) -> void:
	vel_rotacio = 0
	
	if Input.is_action_pressed("Gira dreta"):
		vel_rotacio += vel_rotacio_max
	if Input.is_action_pressed("Gira esquerra"):
		vel_rotacio -= vel_rotacio_max
	if Input.is_action_pressed("Endavant"):
		acceleracio = Vector2.UP.rotated(global_rotation) * accel_max
		$Estela.emitting = true
		so_motor.playing = true
	else:
		acceleracio = -velocity.normalized() * frenada
		$Estela.emitting = false
		so_motor.playing = false
	if pot_disparar and Input.is_action_just_pressed("Dispara"):
		dispara()
	
	if bombes > 0 and Input.is_action_just_pressed("Bomba"):
		esclata_bomba()
	if vida <=0:
		get_tree().change_scene_to_file("res://Escenes/game_over.tscn")
	
	velocity += acceleracio * delta
	global_rotation_degrees += vel_rotacio * delta
	centre.global_rotation_degrees = 0

	move_and_slide()


func esclata_bomba():
	so_bomba.play(0.45)
	bombes -= 1
	area_bomba.monitoring = true
	var tween = create_tween()
	tween.tween_property(forma_area_bomba.shape, "radius", 300, 0.2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	tween.finished.connect(desactiva_area_bomba)
	Global.Marcador.explota_bomba()

func desactiva_area_bomba():
	area_bomba.monitoring = false

func dispara() -> void:
	so_laser.pitch_scale = randf_range(0.8, 1.2)
	so_laser.play()
	crea_bala(dreta.global_position)
	crea_bala(esquerra.global_position)

func hit(mal) -> void:
	vida -= mal

func crea_bala(posicio: Vector2) -> void:
	var nou_laser: Area2D = escena_laser.instantiate()
	nou_laser.global_position = posicio
	nou_laser.global_rotation = global_rotation
	Global.Bales.add_child(nou_laser)

func _on_meteorit_mort() -> void:
	meteorits_morts += 1
	Global.Marcador.actualitza(meteorits_morts)


func _on_area_bomba_area_entered(area: Area2D) -> void:
	area.mor()
