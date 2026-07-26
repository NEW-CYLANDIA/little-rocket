extends Area2D
@onready var sprite = $AnimatedSprite2D

## TODO: Colin managed to break his ship on this
func _ready():
	body_entered.connect(_on_body_entered)
func _on_body_entered(body:Node2D):
	# only bounce in direction
	# approach from any other direction and you die
	if body is SimpleBody:
		sprite.play("bounce")
		var force:Vector2 = Vector2.ZERO;
		if abs(body.linear_velocity.x) > abs(body.linear_velocity.y):
			force.x = -body.linear_velocity.x
		else:
			force.y = -body.linear_velocity.y;
		body.apply_central_impulse(force * 2)
	
