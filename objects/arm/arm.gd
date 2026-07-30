@tool
extends Node2D
@export var attachment:Node2D

## The extend position is set to wherever the attachment is currently.
@export var retract_position_reference:Node2D

@export var speed:float = 10.0;

@export var use_physics:bool = false;

var retract_position:Vector2;
var extend_position:Vector2;
@export var start_retracted:bool = false;

@export var chain_links:int = 20;
@export_tool_button("Update links") var update_links_action = _update_links;

@onready var base = $Base

@onready var chain = $Chain

var retracted:bool = false;

var current_dest:Vector2;

func _ready():
	retract_position = retract_position_reference.position;
	extend_position = attachment.position;
	if start_retracted: 
		attachment.position = retract_position;
		retract();
	else:
		extend();
	_update_links();

func _update_links():
	chain.set_link_amt(chain_links)
	

func _process(delta):
	chain.source = base;
	chain.destination = attachment;
	if not Engine.is_editor_hint():
		if attachment is SimpleBody and use_physics:
			attachment.gravity_scale = 0;
			var force = (current_dest - attachment.position)
			print(force)
			attachment.add_constant_force(force)       
		else:
			if attachment.position.distance_to(current_dest) < 1:
				attachment.position = current_dest;
			else:
				attachment.position = attachment.position.lerp(current_dest, delta * speed)
	
func extend(distance:float = 1):
	retracted = false;
	current_dest = retract_position + (extend_position - retract_position) * distance
func retract(distance:float = 1):
	retracted = true;
	current_dest = extend_position - (extend_position - retract_position) * distance

func toggle():
	print("Here")
	if retracted: extend()
	else: retract();
	
