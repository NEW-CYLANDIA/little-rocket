extends Node2D
@onready var sprite = $Sprite2D
var t:float = 0;
func _process(delta):
	sprite.rotation += delta * 7;
	t+=delta;
	sprite.scale = Vector2.ONE * remap(sin(t*2), -1, 1, 0.75, 1.25)
