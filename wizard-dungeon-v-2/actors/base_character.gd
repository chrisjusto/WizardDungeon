extends CharacterBody2D

@onready var animationplayer: AnimatedSprite2D = $AnimatedSprite2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D
var speed = 60
const acceleration: int = 10
const friction: int = 30

func _physics_process(delta: float) -> void:
		 #Get raw input
	var input = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_raw_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_raw_strength("ui_up")
	).normalized()
	
	
	velocity = input * speed
	move_and_slide()
	global_position = global_position.round()
	print(global_position)

func _process(delta):

	#sprite.global_position = lerp(sprite.global_position, global_position, 10*delta)
	#print(sprite.global_position)
	pass
