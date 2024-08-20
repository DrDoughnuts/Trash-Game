extends Area2D

@onready var win_scene = preload("res://GMTK-2024/Winning/winning.tscn")

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		get_tree().change_scene_to_packed.call_deferred(win_scene)
