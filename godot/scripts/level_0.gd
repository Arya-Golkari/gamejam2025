extends Node2D

@onready var timer : Timer = $Timer
@onready var player : Node2D = $Player
@onready var wall_left : Node2D = $WallLeft

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var position_x = -245
	player.position = Vector2(position_x, 530)
	wall_left.position = Vector2(position_x + 40, 390)
	
	timer.start(1)
	await timer.timeout
	
	while position_x < -30:
		position_x += 2
		await get_tree().create_timer(0.01).timeout
		player.position = Vector2(position_x, player.position.y)
		wall_left.position = Vector2(position_x + 40, wall_left.position.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
