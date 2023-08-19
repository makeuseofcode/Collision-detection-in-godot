extends CharacterBody2D

var speed = 300

func _ready():
	# Inside the player character's script
	var collision_shape = CollisionShape2D.new()
	var polygon_shape = ConvexPolygonShape2D.new()
	polygon_shape.set_points([Vector2(-32, -64), Vector2(32, -64), Vector2(0, 64)])
	collision_shape.shape = polygon_shape
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
	
