extends Area2D

func _ready():
	body_entered.connect(func(body): 
		if body is Ship: body.die();
		else: body.queue_free())
	area_entered.connect(func(area): area.queue_free());
