extends Node2D
@export var max_speed: float = 550
@export var acc: float = 800
@export var dec: float = 900
@export var jumps: int = 1
@export var jump_height: float = -700
@export var gravity: float = 981

@onready var player: CharacterBody2D = get_parent()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not player.is_on_floor():
		player.velocity.y += gravity * delta
	
	#if player.is_on_ceiling() && player.is_on_floor():
	#	Trashmanager.trash -= delta * 20
	if $"../PlayerTakeDamage".hurt_timer <= 0:
		# Handle jump.
		if Input.is_action_just_pressed("jump") and player.is_on_floor():
			player.velocity.y = jump_height

		#Move Left & Right
		if Input.is_action_pressed("move_left"):
			player.velocity.x -= acc * delta
		elif Input.is_action_pressed("move_right"):
			player.velocity.x += acc * delta
		else:
			player.velocity.x -= sign(player.velocity.x) * dec * delta
			if abs(player.velocity.x) < dec * delta:
				player.velocity.x = 0
			
		player.velocity.x = clamp(player.velocity.x, -max_speed, max_speed)
	

	#Fall through One Way Platforms
	player.set_collision_mask_value(6, not Input.is_action_pressed("down"))
		

	player.move_and_slide()
