extends Node2D
class_name Level
@onready var ship = $PlayerSpawn/Ship

signal completed()
signal failed()

func _ready():
	ship.died.connect(func(): 
		await get_tree().create_timer(1.0).timeout
		failed.emit()
	)

func _process(_delta):
	if Input.is_action_just_pressed("reset"):
		failed.emit();

func _on_portal_ship_entered():
	completed.emit();
