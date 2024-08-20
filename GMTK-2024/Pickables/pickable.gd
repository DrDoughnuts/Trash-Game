extends RigidBody2D
class_name Pickable

@onready var held: bool = false
@onready var mouse_in: bool = false
@export var held_damping: float = 2.0
@export var value: float = 450
@onready var sfx_hold := preload("res://GMTK-2024/Player/Magnet/sfx_magnet_hold.wav")
@onready var read_velocity: Vector2 = Vector2(0,0)
enum Garbage_type{
	PLASTIC,
	METAL,
	PAPER,
	RUBBER
}
@export var garbage_type : Garbage_type = Garbage_type.PLASTIC

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("pickables")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:	
	if held == true:
		gravity_scale = 0
		
		apply_central_force((get_global_mouse_position() - global_position) * 10)
		
		set_collision_layer_value(3, false) #Disable Pickable Layer
		set_collision_layer_value(5, true) #Enable Held Layer
		set_collision_mask_value(1, false) #Disable Player Mask
		set_collision_mask_value(3, false) #Disable Pickable Mask
		set_collision_mask_value(5, true) #Enable Held Mask
		
		linear_damp = held_damping
		
		add_to_group("held")
		remove_from_group("pickables")
		
		z_index = 20
		
		if not $SfxHold.playing:
			$SfxHold.playing = true
			$SfxHold.pitch_scale = randf_range(.8, 1.3)
			$SfxPressed.play()
	
	else:
		gravity_scale = 1
		set_collision_layer_value(5, false) #Disable Held Layer
		set_collision_layer_value(3, true) #Enable PIckable Layer
		set_collision_mask_value(5, false) #Disable Held Mask
		set_collision_mask_value(1, true) #Enable Player Mask
		set_collision_mask_value(3, true) #Enable PIckable Mask
		linear_damp = 0
		add_to_group("pickables")
		remove_from_group("held")
		$SfxHold.playing = false
		z_index = 18
		
	$Distortion.visible = held
	
	read_velocity = linear_velocity


"""func _on_mouse_entered() -> void:
	mouse_in = true

func _on_mouse_exited() -> void d:
	mouse_in = false
"""
"""func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed("magnet") && get_tree().get_node_count_in_group("held") < PlayerStats.magnet_limit:
			held = true
"""
