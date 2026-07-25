extends Area2D
@onready var sprite = $AnimatedSprite2D

func _ready():
	body_entered.connect(_on_body_entered)
func _on_body_entered(body:Node2D):
	if body is SimpleBody:
		print("here")
		sprite.play("bounce")
		var force:Vector2 = Vector2.ZERO;
		print(body.linear_velocity.dot(Vector2.from_angle(sprite.global_rotation)))
		if abs(body.linear_velocity.x) > abs(body.linear_velocity.y):
			force.x = -body.linear_velocity.x
		else:
			force.y = -body.linear_velocity.y;
		body.apply_central_impulse(force * 2)
	
