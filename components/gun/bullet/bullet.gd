extends Area2D
class_name Bullet
@onready var sprite = $Sprite2D
var owned_by_ship:bool = false;
@export var speed:int = 50;
var velocity:Vector2 = Vector2.ZERO;
func _ready():
	top_level = true;
	area_entered.connect(func(_a): queue_free());
	body_entered.connect(func(_b): queue_free())
func _physics_process(delta):
	position += velocity * delta;
	sprite.rotation = velocity.angle();
	
	
func shoot(direction:Vector2):
	velocity = direction * speed;
