extends Node2D
@export var connection_scene:PackedScene

func _ready():
	await get_tree().process_frame
	setup_connections()
func setup_connections():
	for child in get_children():
		child.queue_free()
	for node in get_tree().get_nodes_in_group("triggerable"):
		var incoming_connections := node.get_incoming_connections()
		if node is Node2D:
			for connection in incoming_connections:
				var sig:Signal = connection["signal"]
				var source = sig.get_object()
				if source is Node2D:
					var new_connection:Connection = connection_scene.instantiate() as Connection
					new_connection.source = source;
					new_connection.dest = node;
					new_connection.set_signal(sig)
					add_child(new_connection)
