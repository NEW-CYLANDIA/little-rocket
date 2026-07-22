extends Area2D

@export var force:Vector2 = Vector2.ZERO;

var bodies:Array[Node2D] = [];

func _ready():
	body_entered.connect(func(body): bodies.append(body))
	body_exited.connect(func(body): bodies.erase(body))
	
func _physics_process(_delta):
	for body in bodies:
		if body is RigidBody2D:
			body.apply_central_force(force)
