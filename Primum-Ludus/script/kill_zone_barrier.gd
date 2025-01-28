extends Area2D

#@onready var fail_sfx: AudioStreamPlayer2D = $fail_sfx
@onready var gameover_sfx: AudioStreamPlayer2D = $gameover_sfx


func _on_body_entered(_body: Node2D) -> void:
	Engine.time_scale = 0.0
	Music.stop()
	gameover_sfx.play()
	await gameover_sfx.finished
	GameManager.reset_life()
	get_tree().change_scene_to_file("res://Scenes/lobby.tscn")
	Engine.time_scale = 1.0
	Music.play()
