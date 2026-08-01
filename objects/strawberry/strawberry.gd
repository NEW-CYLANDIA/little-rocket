extends SimpleBody
@onready var ship_detector = $ShipDetector

func _ready():
	ship_detector.body_entered.connect(
		func(body): 
			if body is Ship: 
				#TODO: track this...somewhere
				queue_free()
	)
