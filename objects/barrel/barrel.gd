extends SimpleBody
@onready var fuel_output = $FuelOutput
@onready var sprite = $Sprite2D
@onready var collider = $CollisionShape2D


func _on_shootable_destroyed():
	sprite.visible = false;
	fuel_output.trigger();
	queue_free();
