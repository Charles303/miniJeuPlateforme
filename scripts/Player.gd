extends KinematicBody2D


const GRAVITY = 10
const WALK_SPEED = 100
const JUMP_POWER = -350
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

var on_ground = false

func _physics_process(delta):
	velocity.y += delta * GRAVITY

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("ui_up"):
		if on_ground == true:
			velocity.y = JUMP_POWER
			on_ground = false
	velocity.y += GRAVITY
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
	
	velocity = move_and_slide(velocity, FLOOR)
