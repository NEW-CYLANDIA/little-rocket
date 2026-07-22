extends Node2D

@export_group("Continuous movement")
@export var continuous:bool = true;
## Degrees per second
@export var continuous_speed:float = 20;


# For discrete rotations triggered with the function
var degrees_to_rotate:int = 45;
var seconds_to_rotate:float = 0;
var rotation_destination:float = 0;
var timer:float = 0;

func _process(delta: float) -> void:
	if continuous:
		rotation_degrees += continuous_speed * delta;

func do_rotation(degrees:int, time:float):
	var tween = get_tree().create_tween();
	tween.tween_property(self, "rotation_degrees", rotation_degrees + degrees, time)
