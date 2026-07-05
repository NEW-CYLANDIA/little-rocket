extends Force
var on:bool = false;
@export var always_on:bool = false;
@export var accel:float = 50;
var velocity:Vector2 = Vector2.ZERO;
@export var engine:FuelEngine;

func get_velocity():
	if on and engine.fuel_stored > 0:
		var adjusted_accel = accel / (1.0/60.0)
		return Vector2.RIGHT.rotated(global_rotation) * adjusted_accel;
	return Vector2.ZERO;
