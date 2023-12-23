extends KinematicBody2D

var speed = 300
var new_speed: int =  300

var velocity = Vector2.ZERO

func _ready():
	randomize()
	
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-0.8, -0.6, -0.4, -0.4, -0.6, -0.8][randi() % 6]

func _physics_process(delta):
	var objectCollision = move_and_collide(velocity * speed * delta)
	
	if objectCollision: 
		velocity = velocity.bounce(objectCollision.normal)
	
	if velocity.x < 0 and velocity.x > -0.3:
		velocity.x -= 0.2
	if velocity.x > 0 and velocity.x < 0.3:
		velocity.x += 0.2

func _stop(): 
	speed = 0

func _reset(): 
	speed = new_speed
	
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-0.8, -0.6, -0.4, -0.4, -0.6, -0.8][randi() % 6]

func _increase_speed():
# warning-ignore:narrowing_conversion
	new_speed *= 1.01
	print(speed)
