extends Node2D

@onready var stomp: Area2D = $stomp
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var sfx: AudioStreamPlayer2D = $sfx
@onready var turtle: Node2D = $"."
@onready var kill_zone_turtle: Area2D = $KillZoneTurtle

# Variabel untuk kecepatan dan arah gerakan
@export var speed: float = 70.0
@export var left_limit: Vector2 = Vector2(1142, 375)
@export var right_limit: Vector2 = Vector2(1353, 375)

var direction: int = 1  # -1: kiri, 1: kanan

#func _ready():
	#print("KillZone monitoring: ", $KillZoneTurtle.monitoring)

func _process(delta):
	# Gerakkan turtle
	position.x += speed * direction * delta

	# Balik arah jika mencapai batas
	if position.x <= left_limit.x or position.x >= right_limit.x:
		direction *= -1
		animated_sprite_2d.flip_h = direction < 0


const flip_duration = 0.5
var is_flipped = false

func flip_turtle():
	is_flipped = true
	animated_sprite_2d.animation = 'death'
	direction = 0
	animated_sprite_2d.flip_h = true  # Membalik sprite secara vertikal
	#sfx_flip.play()  # Mainkan efek suara
	await get_tree().create_timer(flip_duration).timeout # Tunggu 0.5 detik
	queue_free()  # Hapus turtle dari scene
	#$KillZone.monitoring = false # Matikan KillZone saat turtle terbalik
	


func _on_stomp_body_entered(body: Node2D) -> void:
	if body.name == "Player" and not is_flipped and body.is_on_floor() == false: # Jika yang menyentuh adalah player
		#print("Player detected in proximity")
		#print("KillZone monitoring: ", $KillZoneTurtle.monitoring)
		print("Disabling KillZone for turtle: ", self.name)
		kill_zone_turtle.monitoring = false
		flip_turtle()
		sfx.play() 
		body.bounce()  # Fungsi untuk membuat player memantul
	else:
		# Nonaktifkan efek stomp jika player tidak melompat
		pass
