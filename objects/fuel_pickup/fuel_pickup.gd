extends Area2D

@export var fuel:int = 5;
@onready var fuel_output = $FuelOutput

func _ready():
	fuel_output.amount = fuel;
	body_entered.connect(_on_ship_entered)
	
func _on_ship_entered(_b):
	fuel_output.trigger()
	queue_free();
