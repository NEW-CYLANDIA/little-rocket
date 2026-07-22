extends Node2D
@onready var level_raycast = $LevelRaycast
@onready var detection_raycast = $DetectionRaycast
## in seconds
@export var cooldown:float = 3;
@onready var cooldown_timer = $CooldownTimer
@onready var line_2d = $Line2D

signal saw_player

func _physics_process(_delta):
	line_2d.visible = cooldown_timer.time_left == 0
	var end_point = level_raycast.target_position
	if level_raycast.is_colliding(): end_point = to_local(level_raycast.get_collision_point())
	line_2d.set_point_position(1, end_point)
	detection_raycast.target_position = end_point;
	if detection_raycast.is_colliding() and cooldown_timer.time_left == 0:
		saw_player.emit()
		cooldown_timer.start(cooldown);

	
	
