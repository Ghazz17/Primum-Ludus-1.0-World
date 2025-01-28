extends Area2D

@onready var sfx: AudioStreamPlayer2D = $sfx
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body): 
	GameManager.add_life(1)
	#body.life_ui()
	animation_player.play('hearth')
