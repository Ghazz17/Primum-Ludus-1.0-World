extends Button
@onready var sfx_button: AudioStreamPlayer2D = $sfx_button
#@onready var timer: Timer = $Timer
#@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_pressed() -> void:
	sfx_button.play()
	GameManager.reset_life()
	GameManager.is_restarting = true
	await sfx_button.finished
	LevelManager.retry_level()
	Music.play()
