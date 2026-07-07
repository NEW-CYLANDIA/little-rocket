extends SimpleBody
class_name Ship
@onready var sprite:Sprite2D = $Sprite2D
@onready var rocket = $Sprite2D/Rocket
@onready var gun:Gun = $Sprite2D/Gun

const bullet_scene = preload("uid://dcmwoak7h3oi0")
const explosion_prefab = preload("uid://bd3cjy5makjuh")

enum ControlMode {
	MOUSE,
	WASD
}

@export var control_mode:ControlMode = ControlMode.WASD

var started:bool = false;

var alive:bool = true;

var wasd_direction = Vector2.UP;


func _physics_process(delta):
	if not alive: return;
	var direction:Vector2 = Vector2.ZERO;
	match control_mode:
		ControlMode.MOUSE:
			direction = (get_global_mouse_position() - global_position).normalized();
			
		ControlMode.WASD:
			if started: wasd_direction = Input.get_vector("left", "right", "up", "down")
			direction = wasd_direction
	
	rocket.on = Input.is_action_pressed("gas");
	
	if Input.is_action_just_pressed("fire"):
		gun.toggle(true)
	if Input.is_action_just_released("fire"):
		gun.toggle(false)
	if not is_on_floor(): sprite.rotation = direction.angle()
	else: sprite.rotation = -PI/2;
	
	super(delta);
	
func die():
	if not alive: return;
	alive = false;
	visible = false;
	var new_explosion:Node2D = explosion_prefab.instantiate()
	get_parent().add_child(new_explosion)
	new_explosion.global_position = global_position


func _on_collider_area_entered(_area):
	die();


func _on_collider_body_entered(_body):
	die();
