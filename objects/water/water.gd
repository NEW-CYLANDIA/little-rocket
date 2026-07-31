@tool
extends Area2D
@export var size:Vector2;
@onready var panel = $Panel
@onready var collision_shape = $CollisionShape2D
@onready var gpu_particles = $Panel/GPUParticles2D
func _process(delta):
	var scaled_size = size * 32
	if panel.size != scaled_size:
		panel.size = scaled_size;
		panel.position = -scaled_size/2;
		var rect_shape = collision_shape.shape as RectangleShape2D
		rect_shape.size = scaled_size - Vector2(10, 10);
		var particle_mat:ParticleProcessMaterial = gpu_particles.process_material
		particle_mat.emission_box_extents = Vector3(rect_shape.size.x, rect_shape.size.y, 0);
