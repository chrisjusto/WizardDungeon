extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const Movement_Mod = 32.0
@onready var sprite = $AnimatedSprite2D
enum State {
	IDLE,
	MOVE
}
enum Direction {
	UP,
	DOWN,
	LEFT,
	RIGHT
}
var state: State = State.IDLE
var direction: Direction = Direction.DOWN

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction != Vector2.ZERO:
		velocity = direction * Movement_Mod
		state = State.MOVE
	else: 
		velocity = Vector2.ZERO
		state = State.IDLE
	move_and_slide()
	
#func update_animation():
	#var anim_state = ""
	#match state:
		#State.IDLE:
			
