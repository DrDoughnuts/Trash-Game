extends RichTextLabel
@export var start_time: float = 300
@onready var curr_time: float = start_time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	curr_time -= delta
	var minutes: int = floori(curr_time / 60)
	var seconds: int = floori(curr_time) % 60
	
	text = str(minutes) + " : " + str(seconds)	
