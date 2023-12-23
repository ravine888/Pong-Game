extends KinematicBody2D

var speed = 250

var ball

var zone = OS.get_window_size().x * 0.6

func _ready():
	ball = get_parent().find_node("Ball")

func _physics_process(_delta):
	var velocity = Vector2(0, _get_position())
	velocity = move_and_slide(velocity * speed, Vector2.UP)

func _get_position(): 
	if ball.position.x < zone: 
		return 0
	
	if abs(ball.position.y - position.y) > 28: 
		if ball.position.y > position.y: 
			return 1
		else: 
			return -1
	else: 
		return 0
