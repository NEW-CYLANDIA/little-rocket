class_name Gun
extends Node2D


@export var bullet_scene:PackedScene
@export var owned_by_ship:bool = false;
func _ready():
	pass;
func shoot_bullet():
	var bullet := bullet_scene.instantiate() as Bullet;
	bullet.owned_by_ship = owned_by_ship;
	var shoot_vec = Vector2.from_angle(global_rotation).normalized()
	bullet.global_position = global_position + shoot_vec * 8
	bullet.shoot(shoot_vec)
	get_parent().call_deferred("add_child", bullet);
func shoot_burst(bullets:int = 3, time_between:float = 0.1):
	for i in range(0, bullets):
		shoot_bullet()
		await get_tree().create_timer(time_between).timeout;
