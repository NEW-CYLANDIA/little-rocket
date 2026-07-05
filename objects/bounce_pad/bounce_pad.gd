extends Area2D
@onready var sprite = $AnimatedSprite2D
@export var push_speed:int = 1000;
func _ready():
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body:Node2D):
	if body is SimpleBody:
		var direction = Vector2.from_angle(rotation).normalized() * push_speed;
		body.velocity += direction;
		sprite.play("bounce")
