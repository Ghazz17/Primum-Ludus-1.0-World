extends Button
@onready var sfx_button_quit: AudioStreamPlayer2D = $sfx_button_quit
var original_scale = Vector2.ONE 

func _on_pressed() -> void:
	icon.get_size()
	GameManager.reset_life()
	sfx_button_quit.play()
	await sfx_button_quit.finished
	get_tree().change_scene_to_file("res://Scenes/lobby.tscn")

func _ready():
	original_scale = scale

func _on_button_down() -> void:
	scale = original_scale * 0.9


func _on_button_up() -> void:
	scale = original_scale
