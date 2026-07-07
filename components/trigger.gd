class_name Trigger
extends Node2D

signal triggered

func trigger():
	triggered.emit();
