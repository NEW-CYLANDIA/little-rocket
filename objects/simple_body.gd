class_name SimpleBody
extends RigidBody2D

@export var forces:Array[Force] = [];

@export var max_speed:float = 120;

var speed_locked:bool = true;
func _ready():
	for child in get_children():
		if child is Force: forces.append(child);
func _physics_process(_delta):
	for force in forces:
		apply_central_force(force.get_velocity())
	
func _integrate_forces(state):
	if speed_locked:
		linear_damp = 0.0;
		state.linear_velocity = state.linear_velocity.limit_length(max_speed)
	else:
		linear_damp = 5.0;
		if state.linear_velocity.length() < max_speed:
			speed_locked = true;
func set_gravity (gravity:float):
	gravity_scale=gravity;
