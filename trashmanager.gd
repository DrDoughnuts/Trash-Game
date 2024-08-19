extends Node
@onready var trash: float = 0.0
@onready var time_left: float = 300
@onready var start_time: float = time_left
@onready var rewind_time: float = 8

func _process(_delta: float) -> void:
	if time_left <= 0:
		var tween = get_tree().create_tween().set_trans(Tween.TRANS_QUAD)
		tween.tween_property($".", "time_left", start_time, rewind_time)
		trash = 0
		var enemy_spawner = get_tree().get_first_node_in_group("enemy_spawner")
		if enemy_spawner:
			enemy_spawner.spawn_rate = enemy_spawner.start_rate
		
