extends Area2D

func _ready():
	body_entered.connect(
		func(body): 
			if body is Ship: 
				#TODO: track this...somewhere
				queue_free()
	)
