extends Camera2D

@export var target:Ship;

func _process(_delta):
	if is_instance_valid(target):
		position = position.lerp(target.position + target.linear_velocity * 0.8, 0.02);
