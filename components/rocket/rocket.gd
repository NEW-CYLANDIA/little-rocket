extends Force
var on:bool = false;
@export var always_on:bool = false;
@export var accel:float = 50;
var velocity:Vector2 = Vector2.ZERO;
@export var engine:FuelEngine;
@onready var fuel_exhaust_timer = $FuelExhaustTimer

func _ready():
	if always_on: on = true;
	fuel_exhaust_timer.timeout.connect(func():
		engine.get_fuel(1);
	)
func _process(_delta):
	fuel_exhaust_timer.paused = not on;
	
func get_velocity():
	if engine.fuel_stored > 0 and on:
		var adjusted_accel = accel / (1.0/60.0)
		return Vector2.RIGHT.rotated(global_rotation) * adjusted_accel;
	return Vector2.ZERO;
