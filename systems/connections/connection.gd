class_name Connection
extends Line2D

@export var off_tex:Texture2D
@export var on_tex:Texture2D
var current_tex:Texture2D
var source:Node2D;
var dest:Node2D;
var sig:Signal
@onready var timer = $Timer

func _ready():
	current_tex = off_tex;
	timer.timeout.connect(func(): current_tex = off_tex)
func set_signal(new_signal:Signal):
	sig = new_signal;
	sig.connect(func(): 
		current_tex = on_tex;
		timer.start()
	)
func _process(_delta):
	if is_instance_valid(source) and is_instance_valid(dest):
		set_point_position(0, source.global_position)
		set_point_position(1, dest.global_position)
	else: visible = false;
	texture = current_tex;
	
