extends KinematicBody2D

# signals
signal player_action

# exported variables
export var speed:int = 200

# global variables
var velocity: Vector2

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func try_action():
	var bodies = $Range.get_overlapping_bodies()
	bodies.erase(self)
	
	if bodies.size() > 0:
		do_action(bodies[0])
		
func do_action(target: PhysicsBody2D):
	if(target.story_file != null):
		emit_signal("player_action", target.story_file, target.story_path)

func get_input():
	velocity = Vector2()
	
	if Input.is_action_just_pressed("player_action"):
		try_action()
	if Input.is_action_pressed("player_right"):
		velocity.x += 1
	if Input.is_action_pressed("player_left"):
		velocity.x -= 1
	if Input.is_action_pressed("player_up"):
		velocity.y -= 1
	if Input.is_action_pressed("player_down"):
		velocity.y += 1
		
	velocity = velocity.normalized() * speed