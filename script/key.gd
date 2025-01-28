extends Area2D

@onready var key_label: Label = $"../GameManager/CanvasLayer/KeyLabel"
@onready var key_ui: Sprite2D = $"../GameManager/CanvasLayer/key_ui"
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		body.has_key = true
		key_ui.visible = true
		key_label.visible = true
		#print(body.has_key)
		animation_player.play("pickups")
