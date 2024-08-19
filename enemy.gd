extends RigidBody2D
@onready var hurt_threshold: float = 1500
@onready var dying: bool = false
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")
@export var speed: float = 500.0
@onready var death_timer: float = 2.0
@onready var flung: bool = false
@export var damage: float = 500.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.animation = "default"
	$AnimatedSprite2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dying:
		$AnimatedSprite2D.animation = "dead"
		#rotation += delta * 10
		death_timer -= delta
		modulate = Color(modulate.r, modulate.b, modulate.g, modulate.a - delta/death_timer)
		if death_timer <= 0:
			queue_free()

func _physics_process(delta: float) -> void:
	if not dying:
		apply_central_force((player.global_position - global_position).normalized() * speed)
	else:
		apply_torque(300)
		if not flung:
			flung = true
			apply_central_impulse((global_position - player.global_position).normalized() * speed * 3)

func _on_body_entered(body: Node) -> void:
	if body is Pickable:
		print(body.read_velocity)
		if body.read_velocity.length() > hurt_threshold:
			if not dying:
				$Sfx_Splat.play()
			dying = true
	elif body == player && not dying:
		if player.get_node("PlayerTakeDamage").hurt_timer <= 0:
			Trashmanager.trash -= damage
			player.get_node("PlayerTakeDamage").hurt_timer = player.get_node("PlayerTakeDamage").hurt_length
			$Sfx_Oof.pitch_scale = randf_range(.8, 1.2)
			$Sfx_Oof.play()
