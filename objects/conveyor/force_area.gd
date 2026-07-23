extends Area2D

@export var force:Vector2 = Vector2.ZERO;


	
func _physics_process(_delta):
	for body in get_overlapping_bodies():
		if body is RigidBody2D:
			body.apply_central_force(force)
