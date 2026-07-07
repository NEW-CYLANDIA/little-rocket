class_name Gun
extends Node2D


@export var bullet_scene:PackedScene
@export var bullet_interval:float = 0.5;
@onready var bullet_timer = $BulletTimer

@export var always_firing:bool = true;
@export var engine:FuelEngine;

var fuel_buildup:float = 0;

@export var on:bool = false;
func _ready():
	bullet_timer.timeout.connect(shoot_bullet)
	if always_firing: bullet_timer.start();
func toggle(on_:bool = false):
	self.on = on_;
	if on and always_firing: 
		shoot_bullet();
		bullet_timer.start(bullet_interval)
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
	var shoot_vec = Vector2.from_angle(global_rotation).normalized()
	bullet.global_position = global_position + shoot_vec * 8
	bullet.shoot(shoot_vec)
	add_child(bullet);
func shoot_burst(bullets:int = 3, time_between:float = 0.1):
	on = true;
	for i in range(0, bullets):
		shoot_bullet()
		await get_tree().create_timer(time_between).timeout;
	on = false
