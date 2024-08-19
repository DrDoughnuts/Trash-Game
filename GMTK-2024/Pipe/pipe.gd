extends Area2D
enum Garbage_type{
	PLASTIC,
	METAL,
	PAPER,
}
@onready var metal_sprite = preload("res://GMTK-2024/Pipe/Trash_PipeMTL.png")
@onready var plastic_sprite = preload("res://GMTK-2024/Pipe/Trash_PipePLA.png")
@onready var paper_sprite = preload("res://GMTK-2024/Pipe/Trash_PipePPR.png")
@export var mytype: Garbage_type = Garbage_type.PLASTIC

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match mytype:
		Garbage_type.PLASTIC:
			$Sprite2D.texture = plastic_sprite
			#$Sprite2D.modulate = Color(0, 1, 1)
		Garbage_type.METAL:
			$Sprite2D.texture = metal_sprite
			#$Sprite2D.modulate = Color(.2, .2, .2)
		Garbage_type.PAPER:
			$Sprite2D.texture = paper_sprite
			#$Sprite2D.modulate = Color(.45, .25, 0)

func _on_body_entered(body: Node2D) -> void:
	if body is Pickable:
		if body.garbage_type == mytype:
			Trashmanager.trash += body.value
			$Sfx_trash_in.play()
			body.queue_free()
