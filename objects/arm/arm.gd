@tool
extends Node2D
@export var attachment:Node2D

## The extend position is set to wherever the attachment is currently.
@export var retract_position_reference:Node2D

@export var speed:float = 150.0;

@export var use_physics:bool = false;
# used in physics mode only
@export var damping_force:float = 10.0;

var retract_position:Vector2;
var extend_distance:float;
@export var start_retracted:bool = false;

@export var chain_links:int = 20;
@export_tool_button("Update links") var update_links_action = _update_links;

@onready var base = $Base

@onready var chain = $Chain

var retracting:bool = false;

var move_complete:bool = false;
var current_dest:Vector2;

signal retracted();
signal extended();

func _ready():

	extend_distance = (attachment.global_position - get_retract_position()).length();
	if start_retracted: 
		retract();
	else:
		extend();
	_update_links();

func _update_links():
	chain.set_link_amt(chain_links)
	
func get_retract_position():
	if retract_position_reference:
		return retract_position_reference.global_position;
	else: 
		return base.global_position
func _process(delta):
	chain.source = base;
	chain.destination = attachment;
	if not Engine.is_editor_hint():
		if not move_complete:
			if retracting: current_dest = get_retract_position()
			else: current_dest = get_retract_position() + Vector2.from_angle(global_rotation)*extend_distance
			if attachment is SimpleBody and use_physics:
				attachment.gravity_scale = 0;
				
				var force = (current_dest - attachment.position)
				attachment.apply_central_force(force * speed - attachment.linear_velocity * damping_force)       
				if attachment.position.distance_to(current_dest) < 10 and attachment.linear_velocity.length() < 1:
					move_completed();
			else:
				attachment.global_position = attachment.global_position.lerp(current_dest, delta * delta * speed)
				if attachment.global_position.distance_to(current_dest) < 1:
					move_completed()
					attachment.global_position = current_dest;
				
func move_completed():
	print("Here")
	move_complete = true;
	if retracting: retracted.emit()
	else: extended.emit();
func extend():
	move_complete = false;
	retracting = false;
func retract():
	move_complete = false;
	retracting = true;

func toggle():
	print("Here")
	if retracting: extend()
	else: retract();
	
