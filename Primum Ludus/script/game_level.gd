extends Node2D

# Variabel untuk menyimpan level saat ini
var current_level = 1
var max_level = 3  # Ubah sesuai jumlah level yang Anda miliki

# Fungsi untuk memulai level pertama
func start_game():
	current_level = 1
	load_level()

# Fungsi untuk memuat level berdasarkan current_level
func load_level():
	var level_scene = "res://Scenes/level_" + str(current_level) + ".tscn"
	if ResourceLoader.exists(level_scene):
		get_tree().change_scene_to_file(level_scene)
	else:
		print("Level not found: ", level_scene)

# Fungsi untuk memuat level berikutnya
func next_level():
	if current_level < max_level:
		current_level += 1
		load_level()
	else:
		print("No more levels. Game finished.")
		
func retry_level():
	load_level()
