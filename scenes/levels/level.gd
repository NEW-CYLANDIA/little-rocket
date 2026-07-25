extends Node2D
class_name Level
@onready var ship = $PlayerSpawn/Ship

@export var test_mode:bool = false;
signal completed()
signal failed()

func _ready():
	ship.died.connect(func(): 
		await get_tree().create_timer(1.0).timeout
		failed.emit()
	)
	
	if test_mode:
		failed.connect(get_tree().reload_current_scene)

func _process(_delta):
	if Input.is_action_just_pressed("reset"):
		failed.emit();

func _on_portal_ship_entered():
	completed.emit();
