extends CharacterBody2D

@export var speed = 400


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("Left", "Right")
	velocity.x = speed * direction

	velocity += delta * get_gravity() * 10

	if Input.is_action_pressed("Jump"):
		print("test")
		velocity.y = -1000

	move_and_slide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
