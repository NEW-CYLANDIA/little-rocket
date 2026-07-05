extends Node2D

@export var bullet_scene:PackedScene
@export var bullet_interval:float = 0.5;
@onready var bullet_timer = $BulletTimer

@export var engine:FuelEngine;

var fuel_buildup:float = 0;

var on:bool = false;
func toggle(on_:bool = false):
	self.on = on_;
	if on: 
		shoot_bullet();
		bullet_timer.start(0.2)
	else: 
		bullet_timer.stop();

func _on_bullet_timer_timeout():
	shoot_bullet();

func shoot_bullet():
	if not on: return;
	fuel_buildup += 0.4
	if fuel_buildup > 1:
		if engine.get_fuel(): 
			fuel_buildup = 0
		else: return;
	var bullet := bullet_scene.instantiate() as Bullet;
	bullet.global_position = global_position;
	bullet.shoot(Vector2.from_angle(global_rotation))
	add_child(bullet);
