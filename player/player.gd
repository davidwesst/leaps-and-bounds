extends KinematicBody2D

# signals
signal player_action
signal player_continue

# exported properties
export var speed:int = 200

# local variables
var velocity: Vector2
var currently_in_action = false

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func try_action():
	if currently_in_action == false:
		var bodies = $Range.get_overlapping_bodies()
		bodies.erase(self)
		
		if bodies.size() > 0:
			do_action(bodies[0])	
	else:
		do_continue()
		
func do_action(target: PhysicsBody2D):
	if(target.story_file != null):
		currently_in_action = true
		emit_signal("player_action", target.story_file, target.story_path)
		
func do_continue():
	emit_signal("player_continue")

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
	
func _on_dialogue_complete():
	print_debug("dialogue action complete")
	
	currently_in_action = false
	