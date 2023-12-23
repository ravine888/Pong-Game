extends KinematicBody2D

var speed = 390

func _physics_process(_delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("up"): 
		velocity.y -= 1
	if Input.is_action_pressed("down"): 
		velocity.y += 1
	
	velocity = move_and_slide(velocity * speed, Vector2.UP)

func _freeze(): 
	speed = 0

func _unfreeze():
	speed = 390
