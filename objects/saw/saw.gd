@tool
extends Area2D
@onready var sprite = $Sprite

@export var rotation_amt:float = 33;
@export var rotation_interval:float = 0.1;

var rotation_timer:float = 0;
func _process(delta):
	rotation_timer += delta;
	if rotation_timer >= rotation_interval:
		rotation_timer -= rotation_interval
		sprite.rotate(deg_to_rad(rotation_amt))
	
