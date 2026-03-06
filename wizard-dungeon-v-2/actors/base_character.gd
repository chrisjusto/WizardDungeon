extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D
var speed = 60
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
		 #Get raw input
	var input = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_raw_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_raw_strength("ui_up")
	).normalized()
	if(input.x == 0 && input.y == 0):
		current_state = State.IDLE
	elif(input.y < 0):
		current_state = State.WALKING
		current_direction = Facing.UP
	elif(input.y > 0):
		current_state = State.WALKING
		current_direction = Facing.DOWN
	elif(input.x > 0):
		current_state = State.WALKING
		current_direction = Facing.LEFT	
	elif(input.x < 0):
		current_state = State.WALKING
		current_direction = Facing.RIGHT	
	#elif(input.x > 0 && input.y > 0):
		#current_state = State.WALKING
		#current_direction = Facing.UP
	#elif(input.x > 0 && input.y < 0):
		#current_state = State.WALKING
		#current_direction = Facing.LEFT
	#elif(input.x < 0 && input.y < 0):
		#current_state = State.WALKING
		#current_direction = Facing.RIGHT	
	#elif(input.x < 0 && input.y > 0):
		#current_state = State.WALKING
		#current_direction = Facing.DOWN
			
	velocity = input * speed
	move_and_slide()
	global_position = global_position.round()
	print(State)
	print(Facing)
	update_animation()



func update_animation():
	match current_state:
		State.IDLE:
			match current_direction:
				Facing.UP:
					sprite.animation = ("Idle_BackRight")
					sprite.play()
				Facing.DOWN:
					sprite.animation = ("Idle_FrontLeft")
					sprite.play()
				Facing.LEFT:
					sprite.animation =("Idle_FrontRight")
					sprite.play()
				Facing.RIGHT:
					sprite.animation =("Idle_BackLeft")
					sprite.play()
		State.WALKING:
			match current_direction:
				Facing.UP:
					sprite.animation =("Walk_BackRight")
					sprite.play()
				Facing.DOWN:
					sprite.animation =("Walk_FrontLeft")
					sprite.play()
				Facing.LEFT:
					sprite.animation =("Walk_FrontRight")
					sprite.play()
				Facing.RIGHT:
					sprite.animation =("Walk_BackLeft")
					sprite.play()
