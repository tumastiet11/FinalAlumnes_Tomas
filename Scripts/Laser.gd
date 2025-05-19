extends Area2D

@export var mal: float = 25
@export var velocitat_laser: int = 800
@onready var so_fi: AudioStreamPlayer2D = $SoFi

var velocitat := Vector2.UP * velocitat_laser

func _ready() -> void:
	velocitat = velocitat.rotated(deg_to_rad(global_rotation_degrees))


func _physics_process(delta: float) -> void:
	position += velocitat * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	area.hit(mal)
	mor()

func mor() -> void:
	so_fi.pitch_scale = randf_range(0.9,1.1)
	so_fi.play()
	set_deferred("visible", false)

func _on_so_fi_finished() -> void:
	queue_free()
