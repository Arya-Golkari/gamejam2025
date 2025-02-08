extends Node2D

var notes = Array()
@export var audio_player_path : NodePath
var audio_player : AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_player = get_node(audio_player_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(notes.slice(-7, notes.size()))
	if notes.slice(-7, notes.size()) == ["C4", "C4", "D4", "D4", "E4", "E4", "D4"]:
		audio_player.play()


func _on_xylophone_note(note: String) -> void:
	notes.append(note)
