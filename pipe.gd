extends Area2D
enum Garbage_type{
	PLASTIC,
	METAL,
	PAPER,
	RUBBER
}
@export var mytype: Garbage_type = Garbage_type.PLASTIC

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match mytype:
		Garbage_type.PLASTIC:
			$Sprite2D.modulate = Color(0, 1, 1)
		Garbage_type.METAL:
			$Sprite2D.modulate = Color(.2, .2, .2)
		Garbage_type.PAPER:
			$Sprite2D.modulate = Color(.45, .25, 0)
		Garbage_type.RUBBER:
			$Sprite2D.modulate = Color(1, .1, .1)

func _on_body_entered(body: Node2D) -> void:
	if body is Pickable:
		if body.garbage_type == mytype:
			body.queue_free()
