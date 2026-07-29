extends Node2D

@export var levels:Array[PackedScene] = [];
@export var level_override:PackedScene;

var current_level:Level
var level_index:int = 0;
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	if level_override != null:
		level_index = -1;
		load_level(level_override)
	else:
		load_level(levels[0])

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
func load_level(level:PackedScene):
	if is_instance_valid(current_level): current_level.queue_free();
	current_level = level.instantiate()
	call_deferred("add_child", current_level);
	current_level.completed.connect(_on_level_complete)
	current_level.failed.connect(func(): load_level(level))
func _on_level_complete():
	# we're in override, so just run it back
	if level_index == -1:
		load_level(level_override)
	else:
		level_index += 1;
		if level_index > levels.size():
			level_index = 0;
		load_level(levels[level_index]);
			
		
	level_index += 1;
