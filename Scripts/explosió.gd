extends Sprite2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	animation_player.play('explota', -1, 1.5)
	audio_stream_player_2d.pitch_scale = randf_range(0.7, 1.3)
	audio_stream_player_2d.play()
	rotation = randf_range(0, 360)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
