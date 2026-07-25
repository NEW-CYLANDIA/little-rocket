extends Area2D
@onready var sprite = $AnimatedSprite2D

signal switched()
@export var cooldown:float = 1;
@onready var cooldown_timer = $CooldownTimer

func _ready():
	area_entered.connect(func(_a): switch())
	body_entered.connect(func(_b): switch())
	cooldown_timer.start(0.1)
func switch():
	if cooldown_timer.time_left == 0:
		sprite.play("hit")
		switched.emit();
		cooldown_timer.start(cooldown);
