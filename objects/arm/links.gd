@tool
extends Node2D
class_name Chain
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
	print(destination.name)
	print(source.name);
	if destination == null or source == null: return;
	var pointer = destination.global_position - source.global_position;
	print(pointer)
	pointer = pointer.normalized() * (pointer.length()-2)
	for i in range(0, links.size()):
		links[i].global_position = global_position + (pointer / (links.size()-1)) * i
