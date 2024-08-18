extends AnimatedSprite2D
@onready var player: CharacterBody2D = get_parent().get_parent()

func _ready() -> void:
	play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if player.is_on_floor():
		if player.velocity.x == 0:
			animation = "Idle"
			speed_scale = 1
		else:
			animation = "Run"
			speed_scale = player.velocity.x/$"../../PlayerMovement".max_speed
	else:
		if player.velocity.y <= 0:
			animation = "Jump"
			speed_scale = 1
		else:
			animation = "Fall"
			speed_scale = 1
	
	if get_global_mouse_position().x > get_parent().global_position.x:
		$"..".scale.x = abs($"..".scale.x)
	else:
		$"..".scale.x = -abs($"..".scale.x)
	
