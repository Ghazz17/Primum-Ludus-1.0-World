extends Button

@onready var button_sfx: AudioStreamPlayer2D = $"../Button_sfx"
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var credits_card: Node2D = $".."

func _on_pressed() -> void:
	button_sfx.play()
	await button_sfx.finished
	animation_player.play('zoom_out')
	await animation_player.animation_finished
	credits_card.visible = false
