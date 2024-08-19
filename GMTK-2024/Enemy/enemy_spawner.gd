extends Node2D
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")
@onready var enemy := preload("res://GMTK-2024/Enemy/enemy.tscn")
@export var spawn_rate: float = 0.1
@onready var start_rate: float = spawn_rate
@export var spawn_acc: float = 0.005
@export var max_spawn: float = 0.5
@onready var timer: float = 0
@onready var spawn_distance = 5000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	if timer >= (1/spawn_rate):
		spawn_enemy()
		spawn_rate += spawn_acc
		spawn_rate = min(max_spawn, spawn_rate)
		timer = 0
	

func spawn_enemy() -> void:
	var new_enemy := enemy.instantiate()
	new_enemy.global_position = player.global_position
	new_enemy.global_position += Vector2(spawn_distance, 0).rotated(randf_range(0, -PI))
	
	add_sibling(new_enemy)

	pass
