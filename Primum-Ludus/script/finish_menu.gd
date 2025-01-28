extends Node2D

@onready var main_music: AudioStreamPlayer2D = $Main_music
@onready var victory_sfx: AudioStreamPlayer2D = $victory_sfx

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Music.stop()
	victory_sfx.play()
	await victory_sfx.finished
	main_music.play()
