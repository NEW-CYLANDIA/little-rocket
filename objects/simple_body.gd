class_name SimpleBody
extends CharacterBody2D

@export var gravity:Vector2 = Vector2(0, 120);
@export var friction:float = 10;
@export var max_speed:float = 120;
@export var forces:Array[Force]
@export var angular_friction:float = 10;
var angular_velocity:float = 0;

func apply_force(force:Vector2):
	force = (force + velocity).limit_length(max_speed) - velocity;
	velocity += force;

func _physics_process(delta):
	for force in forces:
		var adjusted_force = force.get_velocity() * delta;
		velocity += (adjusted_force + velocity).limit_length(max_speed) - velocity;
		angular_velocity += force.get_angular_velocity();
	velocity.x = move_toward(velocity.x, 0, friction * delta)
	angular_velocity = move_toward(angular_velocity, 0, friction * delta);
	rotation += angular_velocity;
	velocity += gravity * delta;
	move_and_slide()
