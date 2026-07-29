extends Area2D
class_name Shootable

signal shot
signal destroyed

@export var hp:int = 3;
## Optional, mostly for convenience. Triggered when shot.
@export var flash:FlashSprite;

## Optional
@export var explode_on_death:bool = false;
@export var explosion_prefab:PackedScene = preload("uid://bd3cjy5makjuh")
func _ready():
	area_entered.connect(_on_area_entered)

func _on_area_entered(area:Area2D):
	if area is Bullet:
		area.queue_free();
		if hp > 0:
			if flash:
				flash.start();
			shot.emit()
			hp -= 1;
			if hp <= 0: destroy();
func destroy():
	destroyed.emit();
	if explode_on_death:
		var new_explosion = explosion_prefab.instantiate();
		get_tree().root.add_child(new_explosion);
		new_explosion.global_position = global_position;
	queue_free();
	
