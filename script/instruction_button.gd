extends Button

@onready var instruction_card: Node2D = $"../instruction_card"
@onready var button_sfx: AudioStreamPlayer2D = $"../button_sfx"
@onready var animation_player: AnimationPlayer = $"../instruction_card/AnimationPlayer"

func _on_pressed() -> void:
	button_sfx.play()
	await button_sfx.finished
	instruction_card.visible = true
	animation_player.play('zoom_in')
