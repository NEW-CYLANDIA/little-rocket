extends Node2D
@export var amount:int = 5;
@export var launch_speed:int = 50;
const fuel_prefab = preload("uid://damqophchcn57")

func trigger():
	var angle_increment = 360.0 / amount;
	for i in amount:
		var angle = i * angle_increment
		var new_fuel := fuel_prefab.instantiate() as Fuel;
		new_fuel.launch(Vector2.from_angle(deg_to_rad(angle)).normalized() * launch_speed)
		new_fuel.global_position = global_position;
		get_parent().call_deferred("add_child", new_fuel)
