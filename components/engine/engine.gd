class_name FuelEngine
extends FuelInput
@onready var fuel_consumption_timer = $FuelConsumptionTimer
@onready var exhaust_particles = $Exhaust
@onready var fuel_bar = $FuelBar

@export var exhaust_source:Node2D;
func _ready():
	if exhaust_source:
		exhaust_particles.position = exhaust_source.position;
	super._ready()

func get_fuel(amt:int = 1):
	if fuel_stored >= amt:
		change_fuel(-amt)
		return true;
	return false;
	
func _on_fuel_consumption_timer_timeout():
	if fuel_stored > 0:
		change_fuel(-1);
		exhaust_particles.restart();
func change_fuel(delta:int): 
	super(delta);
	fuel_bar.frame = remap(fuel_stored, 0, max_fuel, 7, 0);
