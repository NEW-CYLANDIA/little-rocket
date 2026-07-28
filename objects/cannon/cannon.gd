extends StaticBody2D
@export var cannonball:PackedScene
var cannonball_override:SimpleBody;
@onready var sprite:AnimatedSprite2D = $Sprite
@export var shoot_power:float = 50;
@onready var input_area:Area2D = $Input
var current_cannonball:SimpleBody;
var old_parent:Node
@onready var cooldown:Timer = $Cooldown

signal cannonball_entered();

func _ready():
	input_area.body_entered.connect(on_body_entered_input)
func fire():
	cooldown.start();
	var new_cannonball:SimpleBody
	if cannonball_override: 
		new_cannonball = cannonball_override
		cannonball_override = null
		old_parent.add_child(new_cannonball)
	else:
		if cannonball:
			new_cannonball = cannonball.instantiate() as SimpleBody
			get_parent().add_child(new_cannonball)
		else: return;
	new_cannonball.speed_locked = false;
	new_cannonball.global_position = global_position + Vector2.from_angle(global_rotation - PI/2).normalized() * 16
	new_cannonball.linear_velocity = Vector2.ZERO;
	new_cannonball.apply_impulse(Vector2.from_angle(global_rotation - PI/2).normalized() * shoot_power);
	sprite.play("shoot")
	current_cannonball = new_cannonball;
func on_body_entered_input(body):
	if body is SimpleBody and body != self and cooldown.time_left == 0: 
		var simple_body := body as SimpleBody; 
		if cannonball_override == null:
			cannonball_override = simple_body
			old_parent = simple_body.get_parent();
			simple_body.get_parent().remove_child(simple_body);
			simple_body.sleeping = true;
			simple_body.linear_velocity = Vector2.ZERO;
			cannonball_entered.emit()

