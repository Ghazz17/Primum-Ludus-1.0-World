extends Button
@onready var button_sfx: AudioStreamPlayer2D = $"../button_sfx"


func _on_pressed() -> void:
	button_sfx.play()
	await button_sfx.finished
	LevelManager.start_game()
	Music.play()
