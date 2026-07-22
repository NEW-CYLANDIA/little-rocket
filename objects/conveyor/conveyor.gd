extends SimpleBody
class_name Conveyor
var speed:float = 1;

@onready var top = $Top
@onready var bottom = $Bottom
@onready var sprite = $Sprite2D

func turn_on():
	top.force = Vector2.from_angle(rotation + PI/2).normalized() * speed;
	bottom.force = top.force * -1;
	sprite.play("default")
func turn_off():
	top.force = Vector2.ZERO;
	bottom.force = Vector2.ZERO;
func reverse():
	top.force *= -1;
	bottom.force *= -1;
	sprite.speed_scale *= -1;
	
