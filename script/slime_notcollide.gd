extends CharacterBody2D  # Untuk Godot 4.0, gunakan KinematicBody2D jika Godot 3.x

@export var speed: float = 60.0  # Kecepatan slime
var direction: int = 1  # 1 untuk ke kanan, -1 untuk ke kiri

@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	# Gerakkan slime
	velocity.x = direction * speed
	move_and_slide()

	# Cek ujung platform
	if not ray_cast_left.is_colliding() and direction == -1:
		_turn_around()
	elif not ray_cast_right.is_colliding() and direction == 1:
		_turn_around()

func _turn_around() -> void:
	# Balik arah
	direction *= -1
	# Flip sprite secara horizontal
	animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
