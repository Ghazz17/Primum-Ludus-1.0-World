extends Button

@onready var finish_masage: Label = $"../finish_masage"

func _on_pressed() -> void:
	if LevelManager.current_level < 3:
		LevelManager.next_level()
		Music.play()
	else:
		finish_masage.visible = true
