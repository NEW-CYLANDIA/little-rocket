class_name SimpleBody
extends CharacterBody2D

@export var gravity:Vector2 = Vector2(0, 120);
@export var friction:float = 10;
@export var max_speed:float = 120;
@export var forces:Array[Force]

func apply_force(force:Vector2):
	force = (force + velocity).limit_length(max_speed) - velocity;
	velocity += force;

func _physics_process(delta):
	for force in forces:
		var adjusted_force = force.get_velocity() * delta;
		velocity += (adjusted_force + velocity).limit_length(max_speed) - velocity;
	velocity.x = move_toward(velocity.x, 0, friction * delta)
	velocity += gravity * delta;
	move_and_slide()
