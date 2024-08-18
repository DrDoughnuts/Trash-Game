extends Node2D
@onready var starty: float = global_position.y
@onready var startx: float = global_position.x
@export var endy: float = -800.0
@onready var moving: bool = false
@onready var myvalue: float = 0.0
@export var rise_speed: float = 50.0
@export var shake_strength: float = 15.0

# Called when the node enters the scene tree for the faaaaaaaaaa irst time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if myvalue <= TrashManager.trash:
		moving = true
		if not $Sfx_rumble.playing:
			$Sfx_rumble.play()
	else:
		moving = false
		$Sfx_rumble.stop()
	if moving:
		position.y -= rise_speed * delta
		myvalue += rise_speed * delta
		position.x = startx + randf_range(-shake_strength, shake_strength)
		
