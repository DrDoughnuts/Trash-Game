extends RichTextLabel
@onready var start_time: float = Trashmanager.time_left
@onready var last_second: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Trashmanager.time_left -= delta
	var minutes: int = floori(Trashmanager.time_left / 60)
	var seconds: int = floori(Trashmanager.time_left) % 60
	if seconds != last_second:
		$Sfx_beep.pitch_scale = .6 + ((seconds % 2) / 6.0)
		$Sfx_beep.play()
	last_second = seconds
	if seconds >= 10:
		text = str(minutes) + " : " + str(seconds)	
	else:
		text = str(minutes) + " : 0" +  str(seconds)
	if Trashmanager.time_left < 0:
		text = "Uh Oh!"
