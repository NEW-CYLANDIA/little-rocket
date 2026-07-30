@tool
extends Node2D
@export var attachment:Node2D

@export var speed:float = 10.0;
@onready var base = $Base

@onready var chain = $Chain

var retracted:bool = false;

var movement:float = 0;

var extension_amt:float;

func _ready():
	extension_amt = (attachment.global_position - base.global_position).get_length()
func _process(_delta):
	chain.source = base;
	chain.destination = attachment;
	
func extend():
	pass;
func retract():
	pass;
#func move_attachment(amount:float):
	#var pointer_vec = attachment.global_position - base.global_position;
