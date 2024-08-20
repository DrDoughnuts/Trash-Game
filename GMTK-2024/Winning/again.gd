extends Button
@onready var level := preload("res://GMTK-2024/THE TRASH COMPACTOR.tscn")


func _ready() -> void:
	$"../Sfx_victory".play()


func _on_pressed() -> void:
	Trashmanager.trash = 0
	Trashmanager.time_left = Trashmanager.start_time
	get_tree().change_scene_to_packed(level)
