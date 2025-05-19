extends TextureProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func actualitza(nou_valor) -> void:
	var tween = create_tween()
	tween.tween_property(self, "value", nou_valor, 0.3).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
