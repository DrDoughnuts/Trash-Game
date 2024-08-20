extends Node2D
@export var pickables: Array[PackedScene]
@export var spawn_rate: float = .1
@onready var timer: float = 0
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".", "spawn_rate", .8, 300)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	if timer > (1 / spawn_rate):
		var new_trash = pickables.pick_random().instantiate()
		new_trash.global_position = player.global_position
		new_trash.global_position.x += randf_range(-2000, 2000)
		new_trash.global_position.y -= 2750
		new_trash.linear_velocity = Vector2(0, 500).rotated(randf_range(0, 2 * PI))
		new_trash.apply_torque(randf_range(-200, 200))
		add_sibling(new_trash)
		timer = 0
