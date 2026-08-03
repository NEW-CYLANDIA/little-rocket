extends StaticBody2D
class_name Conveyor
var speed:float = 1;
@onready var sprite = $Sprite2D

func turn_on():
	constant_linear_velocity = Vector2.from_angle(rotation).normalized() * speed;
	sprite.play("default")
func turn_off():
	constant_linear_velocity = Vector2.ZERO;
	sprite.pause();
func reverse():
	constant_linear_velocity.x *= -1;
	speed *= -1;
func _process(_delta):
	sprite.speed_scale = sign(speed)
	
