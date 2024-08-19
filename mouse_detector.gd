extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	if Input.is_action_pressed("magnet"):
		set_collision_mask_value(3, true)
	else:
		set_collision_mask_value(3, false)



func _on_body_entered(body: Node2D) -> void:
	if body is Pickable:
		if get_tree().get_node_count_in_group("held") < PlayerStats.magnet_limit:
			body.held = true
