extends Area2D

@onready var so_power_up: AudioStreamPlayer2D = $SoPowerUP

func _on_so_power_up_finished() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	body.vida += randi_range(15, 30)
	so_power_up.play()
	hide()
