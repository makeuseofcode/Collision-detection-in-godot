extends CharacterBody2D

var speed = 300

func _ready():
	var collision_shape = CollisionShape2D.new()
	var circle_shape = CircleShape2D.new()
	circle_shape.radius = 32
	collision_shape.shape = circle_shape
	add_child(collision_shape)

func _physics_process(delta):
	var input_dir = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("ui_right"):
		input_dir.x += 1
	if Input.is_action_pressed("ui_up"):
		input_dir.y -= 1
	if Input.is_action_pressed("ui_down"):
		input_dir.y += 1

	velocity = input_dir.normalized() * speed
	var collision = move_and_collide(velocity * delta)

	if collision:
		print("Collided")
