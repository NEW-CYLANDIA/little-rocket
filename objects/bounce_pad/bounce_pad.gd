extends StaticBody2D
@onready var sprite = $AnimatedSprite2D
@onready var area_2d = $Area2D

@export var bounce_speed:float = 400;
func _ready():
	area_2d.body_entered.connect(_on_body_entered)

func _on_body_entered(body:Node2D):
	# only bounce in direction
	# approach from any other direction and you die
	if body is SimpleBody:
		
		var facing_vec = Vector2.from_angle(sprite.global_rotation).normalized() * bounce_speed
		sprite.play("bounce")
 		
		body.apply_central_impulse(facing_vec)
