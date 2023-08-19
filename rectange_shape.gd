extends CharacterBody2D

var speed = 300


func _ready():
	var collision_shape = CollisionShape2D.new()
	var rect_shape = RectangleShape2D.new()
	rect_shape.extents = Vector2(32, 64)
	collision_shape.shape = rect_shape
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
	move_and_collide(velocity * delta)
	
