extends StaticBody2D
@onready var sprite = $AnimatedSprite2D
@onready var body_detector = $BodyDetector

func _ready():
	body_detector.body_entered.connect(_on_body_entered)
func _on_body_entered(body:Node2D):
	if body is SimpleBody:
		sprite.play("bounce")
	
