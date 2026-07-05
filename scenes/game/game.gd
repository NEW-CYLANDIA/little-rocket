extends Node2D

@onready var ship = $Ship
@onready var camera = $Camera2D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
func _process(_delta):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene();
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
