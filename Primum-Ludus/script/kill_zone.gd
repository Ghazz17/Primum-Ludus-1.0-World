extends Area2D

@onready var timer: Timer = $Timer
#@onready var game_manager: Node2D = $"/root/CuyRun/GameManager"
@onready var hurt_sfx: AudioStreamPlayer2D = $hurt_sfx
@onready var fail_sfx: AudioStreamPlayer2D = $fail_sfx

func _on_body_entered(body: Node2D) -> void:
	if GameManager.life <= 3:
		GameManager.life -= 1
		#print(body.life)
		hurt_sfx.play()
		body.life_ui()
		body.start_blink()
	if GameManager.life == 0:
		hurt_sfx.stop()
		Music.stop()
		fail_sfx.play()
		Engine.time_scale = 0.5
		body.get_node("CollisionShape2D").queue_free()
		timer.start()
	
func _on_timer_timeout() -> void:
	await fail_sfx.finished
	Engine.time_scale = 1.0
	GameManager.reset_life()
	get_tree().reload_current_scene()
	Music.play()
