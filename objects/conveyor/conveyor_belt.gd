# Just encompasses and sends signals to multiple conveyors
extends Node2D
var conveyors:Array[Conveyor]

@export var speed:float = 0.5;
@export var start_on:bool = false;

func _ready():
	
	for child in get_children():
		var conveyor = child as Conveyor
		conveyor.speed = speed;
		if start_on: conveyor.turn_on();
		conveyors.append(conveyor)
		
		
func turn_on():
	for c in conveyors: c.turn_on()
func turn_off():
	for c in conveyors: c.turn_off();
func reverse():
	for c in conveyors: c.reverse();
