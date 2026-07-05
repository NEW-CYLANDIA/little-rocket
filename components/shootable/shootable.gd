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
	area_entered.connect(_on_shot)

func _on_shot(_area:Area2D):
	if hp > 0:
		if flash:
			flash.start();
		shot.emit()
		hp -= 1;
		if hp <= 0:
			destroyed.emit();
			if explode_on_death:
				var new_explosion = explosion_prefab.instantiate();
				add_child(new_explosion);
				new_explosion.global_position = global_position;
	
