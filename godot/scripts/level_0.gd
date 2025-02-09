extends Node2D

@onready var timer : Timer = $Timer
@onready var player : Node2D = $Player
@onready var wall_right : Node2D = $WallRight
@onready var background : Node2D = $Background
@onready var skeleton : Sprite2D = $Skeleton
@onready var line1 : Sprite2D = $Line1
@onready var line2 : Sprite2D = $Line2

@export var room0 : Texture2D
@export var open2 : Texture2D
@export var open3 : Texture2D
@export var open4 : Texture2D
@export var open5 : Texture2D
@export var open6 : Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	line1.visible = false
	line2.visible = false
	player.visible = false
	skeleton.visible = false
	await get_tree().create_timer(2.5).timeout
	background.texture = open3
	await get_tree().create_timer(2.5).timeout
	background.texture = open4
	await get_tree().create_timer(2.5).timeout
	background.texture = open5
	await get_tree().create_timer(2.5).timeout
	background.texture = open6
	
	
	background.texture = room0
	background.scale = Vector2(2, 2)
	player.visible = true
	skeleton.visible = true
	
	await get_tree().create_timer(2).timeout
	line1.visible = true
	await get_tree().create_timer(4).timeout
	line1.visible = false
	await get_tree().create_timer(2).timeout
	line2.visible = true
	await get_tree().create_timer(4).timeout
	line2.visible = false
	wall_right.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
