extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -600.0
var has_key: bool = false
@onready var player_ui: AnimatedSprite2D = $AnimatedSprite2D
@onready var sfx_jump: AudioStreamPlayer2D = $"SFX_jump"
@onready var life_label: Label = $"../GameManager/CanvasLayer/LifeLabel"
#var life = 3
@onready var flash_sfx: AudioStreamPlayer2D = $flash_sfx

func _ready():
	GameManager.player = self  # Daftarkan Player ke Global
	life_ui()

func life_ui():
	if life_label:
		life_label.text = "Life  : " + str(GameManager.life)
	else:
		print("LifeLabel not found!")

func _physics_process(delta: float) -> void:
	
	if velocity.x > 0 or velocity.x < 0:
		player_ui.animation = "run"
	else:
		player_ui.animation = "idle"

	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sfx_jump.play()

		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		player_ui.flip_h = direction < 0
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func bounce():
	velocity.y = -500  # Atur nilai ini untuk menentukan seberapa tinggi player memantul

# klip-klip efek
var is_invincible = false
var blink_time = 1.5  # Total durasi berkedip dalam detik
var blink_speed = 0.1  # Kecepatan berkedip
var original_modulate = Color(1, 1, 1, 1)

func start_blink():
	if is_invincible:
		return
		
	is_invincible = true
	var tween = create_tween()
	original_modulate = modulate  # Simpan warna asli
	
	# Membuat sequence berkedip
	for i in range(int(blink_time / (blink_speed * 2))):
		flash_sfx.play()
		# Fade ke transparan
		tween.tween_property(self, "modulate:a", 0.3, blink_speed * 0.5)
		# Fade kembali ke normal
		tween.tween_property(self, "modulate:a", 1.0, blink_speed * 0.5)
	
	# Setelah sequence selesai
	await tween.finished
	reset_after_blink()

func reset_after_blink():
	is_invincible = false
	modulate = original_modulate  # Kembalikan ke warna asli
