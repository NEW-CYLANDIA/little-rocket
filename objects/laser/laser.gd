@tool
extends Line2D
@onready var collision_shape = $Area2D/CollisionShape2D

func _process(_delta):
	var seg_shape = collision_shape.shape as SegmentShape2D
	seg_shape.a = get_point_position(0)
	seg_shape.b = get_point_position(1);
