extends Node2D

var notes = Array()
@export var fanfare_player_path : NodePath
var fanfare_player : AudioStreamPlayer
@onready var c4_player : AudioStreamPlayer = $XylophoneC4Player
@onready var e4_player : AudioStreamPlayer = $XylophoneE4Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fanfare_player = get_node(fanfare_player_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if notes.slice(-7, notes.size()) == ["C4", "C4", "D4", "D4", "E4", "E4", "D4"]:
		fanfare_player.play()


func background_music() -> void:
	pass


func _on_xylophone_note(note: String) -> void:
	notes.append(note)
