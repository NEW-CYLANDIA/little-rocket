@tool
extends Node2D
@export var source:Node2D;
@export var destination:Node2D;
@export var link_amount:int = 20;
@export var link_scene:PackedScene;

var links:Array[Node2D] = [];

func _ready():
	for i in link_amount:
		var new_link = link_scene.instantiate();
		add_child(new_link)
		links.append(new_link);
func _process(_delta):
	var pointer = destination.position - source.position;
	for i in range(0, links.size()):
		if i <= link_amount:
			links[i].position = (pointer / link_amount) * i
		else:
			links[i].visible = false;
