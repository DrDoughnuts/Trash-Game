extends Button
@onready var level := preload("res://GMTK-2024/THE TRASH COMPACTOR.tscn")

func _on_pressed() -> void:
	get_tree().change_scene_to_packed(level)


func _on_hint_mouse_entered() -> void:
	$"../Hint/tutorial".visible = true
	
func _on_hint_mouse_exited() -> void:
	$"../Hint/tutorial".visible = false
