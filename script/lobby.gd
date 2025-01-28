extends Node2D

@onready var lobby_music: AudioStreamPlayer2D = $Lobby_music

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Music.stop()
	#lobby_music.play()
