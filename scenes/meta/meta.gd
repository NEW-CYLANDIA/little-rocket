extends Node2D
class_name Meta
enum Scene {
	GAME
}

@export var scenes:Dictionary[Scene, PackedScene]
@export var first_scene:Meta.Scene;
var current_scene:Node2D = null

static var instance:Meta;

func _ready():
	Meta.instance = self;
	change_scene(first_scene)
	
func change_scene(new_scene:Scene):
	if is_instance_valid(current_scene):
		current_scene.queue_free();
	current_scene = scenes[new_scene].instantiate()
	add_child(current_scene)
	
