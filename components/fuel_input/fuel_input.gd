extends Node2D
class_name FuelInput
## ensure this is set to look for fuel
@export var input_area:Area2D
## ensure this is set to look for fuel
@export var detect_area:Area2D

## 9 maps directly to sprite frames
@export var max_fuel:int = 10;
@export var start_fuel:int = 10;


var fuel_stored:int = 0;

var fuel_detected:Array[Node2D]

@export var suck_speed:float = 1000;

func _ready():
	change_fuel(start_fuel)
	detect_area.area_entered.connect(_on_detect_area_entered)
	input_area.area_entered.connect(_on_input_area_entered)
	fuel_stored = start_fuel;
	

func _on_detect_area_entered(area:Area2D):
	if area is Fuel:
		var fuel := area as Fuel;
		fuel.register_input(self);
	
func _on_input_area_entered(area:Area2D):
	if area is not Fuel:
		push_error("FuelInput: We sucked up something that's not fuel");
	else:
		change_fuel(1);
	area.queue_free();
	
func change_fuel(delta:int):
	fuel_stored += delta;
	fuel_stored = clamp(fuel_stored, 0, max_fuel)
