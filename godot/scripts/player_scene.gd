extends Node2D

signal ready_to_leave


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_ready_to_leave() -> void:
	emit_signal("ready_to_leave")
