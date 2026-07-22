extends SimpleBody
@export var cannonball:PackedScene
var cannonball_override:SimpleBody;
@onready var sprite:AnimatedSprite2D = $Sprite
@export var shoot_power:float = 50;
@onready var input_area:Area2D = $Input

func _ready():
	input_area.body_entered.connect(on_body_entered_input)
func fire():
	var new_cannonball:SimpleBody
	if cannonball_override: new_cannonball = cannonball_override
	else: new_cannonball = cannonball.instantiate() as SimpleBody
	get_parent().call_deferred("add_child", new_cannonball)
	new_cannonball.position = position + Vector2.from_angle(rotation - PI/2).normalized() * 16;
	new_cannonball.apply_impulse(Vector2.from_angle(rotation - PI/2).normalized() * shoot_power);
	sprite.play("shoot")
func on_body_entered_input(body):
	if body is SimpleBody and body != self: 
		var simple_body := body as SimpleBody;
		var pointer = (simple_body.global_position - global_position).normalized();
		if pointer.angle_to(simple_body.linear_velocity) < PI/4:
			cannonball_override = body
			body.get_parent().call_deferred("remove_child", body);
