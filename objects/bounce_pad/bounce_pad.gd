extends StaticBody2D
@onready var sprite = $AnimatedSprite2D
@onready var bounce_pad = $BouncePad
@onready var ray_cast_2d = $RayCast2D

var min_bounce_speed:float = 100;
func _ready():
	bounce_pad.body_entered.connect(_on_body_entered)
	
func _process(delta):
	var facing_vec = Vector2.from_angle(sprite.global_rotation).normalized()
	ray_cast_2d.target_position = facing_vec * 50
func _on_body_entered(body:Node2D):
	# only bounce in direction
	# approach from any other direction and you die
	if body is SimpleBody:
		
		var body_dir = body.linear_velocity.normalized();
		var facing_vec = Vector2.from_angle(sprite.global_rotation).normalized() * -1

		if body_dir.dot(facing_vec) > 0.75:
			var force:Vector2 = Vector2.ZERO;
			if abs(body.linear_velocity.x) > abs(body.linear_velocity.y):
				force.x = -body.linear_velocity.x * 2
			else:
				force.y = -body.linear_velocity.y * 2;
	 
			if force.length() < min_bounce_speed: force = force.normalized() * min_bounce_speed
			body.speed_locked = false;
			body.apply_central_impulse(force)
