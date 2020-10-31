extends KinematicBody2D

var speed = 400;
var move_direction = Vector2(0,0)
var attack = false

signal interact

func _physics_process(delta):
	if (attack == false):
		MovementLoop()
	
func _process(delta):
	if (Input.is_action_pressed("attack")):
		attack = true;
		self.get_node("AnimatedSprite").play("attack")
	if (attack == true && (self.get_node("AnimatedSprite").get_frame() == 5)):
		attack = false;
	if (Input.is_action_pressed("interact")):
		emit_signal("interact")
		
	
func MovementLoop():
	move_direction.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	move_direction.y = (int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))) / float(2)
	var motion = move_direction.normalized() * speed
	move_and_slide(motion)
	
		
	if (move_direction.length() == 0 && self.get_node("AnimatedSprite").get_animation() != "idle"):
		self.get_node("AnimatedSprite").play("idle")
		
	if (!(move_direction.length() == 0 && self.get_node("AnimatedSprite").get_animation() != "run")):
		self.get_node("AnimatedSprite").play("run")
		
	if (move_direction.x < 0):
		self.get_node("AnimatedSprite").set_flip_h(true)
	elif (move_direction.x > 0):
		self.get_node("AnimatedSprite").set_flip_h(false)
		




	
	


		
		
		
		
		
		
		
		
	
