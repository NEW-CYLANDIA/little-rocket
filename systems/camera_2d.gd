extends Camera2D

@export var target:RigidBody2D;

func _process(_delta):
	if is_instance_valid(target):
		global_position = global_position.lerp(target.global_position + target.linear_velocity * 0.8, 0.02);
