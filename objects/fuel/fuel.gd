extends Area2D
class_name Fuel

var velocity:Vector2;
@export var friction = 0.9;

var registered_inputs:Array[FuelInput]
func _physics_process(delta):
	# If we're detected by multiple inputs,
	# only go towards closest one.
	if registered_inputs.size() > 0:
		registered_inputs.sort_custom(func(a:Node2D, b:Node2D): 
			return global_position.distance_to(a.global_position) < global_position.distance_to(b.global_position))
		var desired_input = registered_inputs[0]
		if is_instance_valid(desired_input):
			velocity += (desired_input.global_position - global_position).normalized() * desired_input.suck_speed * delta;
	velocity *= friction
	position += velocity * delta;

func register_input(fuel_input:FuelInput):
	registered_inputs.append(fuel_input);
func launch(vec:Vector2):
	velocity = vec;
