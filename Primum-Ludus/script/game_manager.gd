extends Node2D

#@onready var life_label: Label = %'GameManager/CanvasLayer/LifeLabel'
@onready var score_label: Label = $"CanvasLayer/ScoreLabel"
var score = 0
var life = 3
var player = null
const INITIAL_LIFE = 3
var is_restarting: bool = false

func add_life(amount: int):
	life += amount
	life = min(life, 5)  # Maksimum life 5, sesuaikan jika perlu
	if player:
		player.life_ui()


func reset_life():
	life = INITIAL_LIFE
	if player and is_instance_valid(player):
		player.life_ui()

func _ready():
	is_restarting = false


func add_score():
	score += 1
	score_label.text = "Score: "+ str(score)
