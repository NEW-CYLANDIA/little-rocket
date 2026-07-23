extends Node2D
class_name TimerComp
@onready var timer = $Timer

signal timeout
@export var wait_time:float = 1.0
@export var one_shot:bool = false;
@export var auto_start:bool = true;
@onready var sprite:AnimatedSprite2D = $AnimatedSprite2D
func _ready():
	timer.wait_time = wait_time;
	if auto_start: timer.start();
	timer.one_shot = one_shot;
	timer.timeout.connect(func(): timeout.emit());
	
func _process(_delta):
	@warning_ignore("narrowing_conversion")
	sprite.frame = remap(timer.time_left, 0, wait_time, 8, 0)

func start():
	timer.start();
