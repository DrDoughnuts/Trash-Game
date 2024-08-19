extends RichTextLabel
@export var start_time: float = 300
@onready var curr_time: float = start_time
@onready var last_second: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	curr_time -= delta
	var minutes: int = floori(curr_time / 60)
	var seconds: int = floori(curr_time) % 60
	if seconds != last_second:
		$Sfx_beep.pitch_scale = .6 + ((seconds % 2) / 6.0)
		$Sfx_beep.play()
	last_second = seconds
	if seconds >= 10:
		text = str(minutes) + " : " + str(seconds)	
	else:
		text = str(minutes) + " : 0" +  str(seconds)
