extends Button

@onready var button_sfx: AudioStreamPlayer2D = $"../button_sfx"
@onready var credits_card: Node2D = $"../credits_card"
@onready var animation_player: AnimationPlayer = $"../credits_card/AnimationPlayer"


func _on_pressed() -> void:
	button_sfx.play()
	await button_sfx.finished
	credits_card.visible = true
	animation_player.play('zoom_in')
