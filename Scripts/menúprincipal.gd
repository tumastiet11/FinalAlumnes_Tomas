extends Control


func _ready():
	# Global.PUNTMAXFILEPATH val "user://PuntuacioMax.txt"
	# Per guardar fitxers s'ha de fer en la carpeta user:// que varia la seva
	# ubicació segons el sistema operatiu. Per obrir la carpeta podeu anar al
	# menú Projecte/Obre el directori de Dades del Projecte
	var fitxer = FileAccess.open(Global.PUNTMAXFILEPATH, FileAccess.READ) # Obrim el fitxer
	# en mode lectura
	var max_punt
	if fitxer != null: # Si el fitxer s'ha obert correctament
		max_punt = fitxer.get_var()
		if max_punt == null: # Si el fitxer no conté res legible
			max_punt = 0
		fitxer.close()
	else:
		max_punt = 0
	
	Global.puntuacio_max = max_punt # Guardem la puntuació en una variable global

