extends Area2D

signal meteorit_mort

var vida: float = 100
var velocitat_gir := randf_range(-5, 5)
var escala := randf_range(0.3, 1.2)
var velocitat = (Vector2.RIGHT * randf_range(100, 600)).rotated(randf_range(0, 2*PI))

func _ready() -> void:
	scale = Vector2(escala, escala)
	meteorit_mort.connect(Global.Nau._on_meteorit_mort)

func _physics_process(delta: float) -> void:
	rotate(velocitat_gir * delta)
	position += velocitat * delta
	if global_position.distance_squared_to(Global.Nau.global_position) > pow(3000,2):
		queue_free()

func hit(mal) -> void:
	vida -= mal
	if vida <= 0:
		mor()

func mor():
	meteorit_mort.emit()
	potser_powerup()
	queue_free()

func potser_powerup() -> void:
	if randi_range(1, 10) > 2:
		return
	var escena: PackedScene
	if randi_range(0, 1) == 0:
		escena = Global.escena_powerup_bomba
	else:
		escena = Global.escena_powerup_vida
	var nou_powerup = escena.instantiate()
	Global.PowerUPs.add_child.bind(nou_powerup).call_deferred()
	nou_powerup.global_position = global_position
	
func _on_body_entered(body: Area2D) -> void:
	body.hit(escala * 20)
	mor()
