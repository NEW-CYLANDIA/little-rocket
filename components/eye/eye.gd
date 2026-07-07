extends Trigger
@onready var raycast = $RayCast2D
## in seconds
@export var cooldown:float = 3;
@onready var cooldown_timer = $CooldownTimer
@onready var line_2d = $Line2D

func _physics_process(_delta):
	print(cooldown_timer.time_left)
	line_2d.visible = cooldown_timer.time_left == 0
	if raycast.is_colliding() and cooldown_timer.time_left == 0:
		print(raycast.get_collider())
		trigger();
		cooldown_timer.start(cooldown);

	
	
