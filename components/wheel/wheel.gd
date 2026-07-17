extends Node2D

@export_group("Continuous movement")
@export var continuous:bool = true;
## Degrees per second
@export var continuous_speed:float = 20;

@export_group("Discrete movement")
@export var discrete:bool = false;
## In degrees
@export var discrete_step_size:int = 45;
## How long we wait on a given step
@export var discrete_step_wait:float = 0.5;
## How long it takes to rotate to the next step in seconds
@export var discrete_step_move_time:float = 0.5;

var discrete_timer:float = 0;

func _process(delta: float) -> void:
	if discrete:
		discrete_timer += delta;
		if discrete_timer > discrete_step_wait:
			# one degree a second
			rotation_degrees += (discrete_step_size/discrete_step_move_time) * delta;
			
		if discrete_timer > discrete_step_wait + discrete_step_move_time:
			discrete_timer = 0;
		
