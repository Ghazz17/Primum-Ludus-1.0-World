extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body.has_key:
		Engine.time_scale = 0.8
		#print('Exit the Game...')
		timer.start()
	else:
		print('Not Key!')
		#
func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().change_scene_to_file("res://Scenes/finish_menu1.tscn")
	#finish_menu.visible = true
	
	
