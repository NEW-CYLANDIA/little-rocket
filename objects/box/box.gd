@tool
extends SimpleBody
@onready var collision_shape = $CollisionShape2D
@onready var panel:Panel = $Box

@export var size: Vector2 = Vector2(1, 1)

@export var debug:bool = false;

func _process(_d):
	var scaled_size = size * 16;
	if panel.size != scaled_size:
		panel.size = scaled_size;
		panel.position = -scaled_size/2;
		var rect_shape = collision_shape.shape as RectangleShape2D
		rect_shape.size = scaled_size - Vector2.ONE;
func _physics_process(_delta):
	if not Engine.is_editor_hint(): super(_delta);
