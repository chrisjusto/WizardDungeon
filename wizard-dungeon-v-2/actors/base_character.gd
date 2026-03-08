extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D
var speed = 60.0
const acceleration: int = 10
const friction: int = 30

enum State {
	IDLE,
	WALKING
}

enum Facing {
	UP,
	DOWN,
	RIGHT,
	LEFT
}
var current_state = State.IDLE
var current_direction = Facing.DOWN

func _physics_process(delta: float) -> void:
	var input = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_raw_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_raw_strength("ui_up")
	).normalized()
	
	velocity = input * speed
	print(velocity)
	move_and_slide()
	global_position = global_position.round()
