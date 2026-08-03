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
var extend_position:Vector2;
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
	if retract_position_reference:
		retract_position = retract_position_reference.position;
	else: retract_position = base.global_position
	extend_position = attachment.position;
	if start_retracted: 
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
		if not move_complete:
			if attachment is SimpleBody and use_physics:
				attachment.gravity_scale = 0;
				
				print(attachment.linear_velocity)
				var force = (current_dest - attachment.position)
				attachment.apply_central_force(force * speed - attachment.linear_velocity * damping_force)       
				if attachment.position.distance_to(current_dest) < 10 and attachment.linear_velocity.length() < 1:
					move_completed();
			else:
				attachment.position = attachment.position.lerp(current_dest, delta * delta * speed)
				if attachment.position.distance_to(current_dest) < 1:
					move_completed()
					attachment.position = current_dest;
				
func move_completed():
	print("Here")
	move_complete = true;
	if retracting: retracted.emit()
	else: extended.emit();
func extend(distance:float = 1):
	move_complete = false;
	retracting = false;
	current_dest = retract_position + (extend_position - retract_position) * distance
func retract(distance:float = 1):
	move_complete = false;
	retracting = true;
	current_dest = extend_position - (extend_position - retract_position) * distance

func toggle():
	print("Here")
	if retracting: extend()
	else: retract();
	
