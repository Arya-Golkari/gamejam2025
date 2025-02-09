extends Node2D

var player := AudioStreamPlayer.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sound = load("res://audio/lmao.mp3")
	player.stream = sound
	add_child(player)
	player.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
