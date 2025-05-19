extends CanvasLayer

@onready var label: Label = $Label
@onready var barra_bombes: TextureProgressBar = $Bombes/MarginContainer/BarraBombes
@onready var mat: ShaderMaterial = $ColorRect.material as ShaderMaterial 

func _ready() -> void:
	pass

func actualitza(nova_puntuacio: int) -> void:
	pass

func canvi_bombes(noves_bombes: int) -> void:
	barra_bombes.value = noves_bombes

func explota_bomba() -> void:
	var tween = create_tween()
	tween.tween_property(mat, "shader_parameter/radius", 0.5, 0.2)
	tween.tween_property(mat, "shader_parameter/radius", 0,0)
