extends Area2D
@onready var sprite = $Sprite2D
var t:float = 0;

signal ship_entered
func _ready():
	# TODO: Do some anim before this
	body_entered.connect(func(_body): ship_entered.emit())
func _process(delta):
	sprite.rotation += delta * 7;
	t+=delta;
	sprite.scale = Vector2.ONE * remap(sin(t*2), -1, 1, 0.75, 1.25)
	
