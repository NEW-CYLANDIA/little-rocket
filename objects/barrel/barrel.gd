extends Node2D
@onready var fuel_output = $FuelOutput
@onready var sprite = $Sprite2D
@onready var collider = $Collider


func _on_shootable_destroyed():
	sprite.visible = false;
	fuel_output.trigger();
	collider.queue_free();
