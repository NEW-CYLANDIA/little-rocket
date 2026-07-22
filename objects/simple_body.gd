class_name SimpleBody
extends RigidBody2D

@export var forces:Array[Force] = [];

@export var max_speed:float = 120;


func _physics_process(_delta):
	for force in forces:
		apply_central_force(force.get_velocity())
	
func _integrate_forces(state):
	state.linear_velocity = state.linear_velocity.limit_length(max_speed)
