extends Button
var level

func _ready() -> void:
	$"../Sfx_victory".play()
	


func _on_pressed() -> void:
	Trashmanager.trash = 0
	Trashmanager.time_left = Trashmanager.start_time
	level = load("res://GMTK-2024/THE TRASH COMPACTOR.tscn")
	get_tree().change_scene_to_packed.call_deferred(level)
