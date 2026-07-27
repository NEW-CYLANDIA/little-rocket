@tool
extends Line2D
@onready var collision_shape = $Area2D/CollisionShape2D
@onready var area_2d = $Area2D
@export var toggled:bool = true;

func _ready():
	update_display();
	
func _process(_delta):
	var seg_shape = collision_shape.shape as SegmentShape2D
	seg_shape.a = get_point_position(0)
	seg_shape.b = get_point_position(1);
	if Engine.is_editor_hint(): update_display();

func update_display():
	if not Engine.is_editor_hint():
		collision_shape.set_deferred("disabled", not toggled)
		visible = toggled;
	else:
		modulate.a = 1.0 if toggled else 0.3;
func toggle():
	toggled = not toggled;
	update_display()
