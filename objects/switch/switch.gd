extends Area2D
@onready var sprite = $AnimatedSprite2D

signal switched()


@export var connection_scene:PackedScene
@export var cooldown:float = 5;
@onready var cooldown_timer = $CooldownTimer

func _ready():
	
	area_entered.connect(_on_area_entered)
	
func _on_area_entered(_area):
	if cooldown_timer.time_left == 0:
		sprite.play("hit")
		switched.emit();
		cooldown_timer.start(cooldown);
