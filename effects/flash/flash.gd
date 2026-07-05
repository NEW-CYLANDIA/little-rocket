extends Sprite2D
class_name FlashSprite
@onready var timer = $Timer
func _ready():
	visible = false;
	timer.timeout.connect(func(): visible = false)
func start():
	visible = true;
	timer.start();
	
	
	
