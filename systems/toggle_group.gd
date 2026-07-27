@tool
extends Node2D

@export var toggled:bool = true : 
	set(new_toggled):
		toggled = new_toggled
		for child in get_children():
			if child.has_method("toggle"):
				child.call("toggle")

func toggle():
	toggled = not toggled;
