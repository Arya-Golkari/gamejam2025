extends Node2D

signal xylophone_c4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_xylophone_c4() -> void:
	emit_signal("xylophone_c4")
