extends Sprite2D

@onready var bounce_haxen = $"."
@onready var collision_shape_2d = $CollisionShape2D

var ySpeed = 60

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += ySpeed * delta
	ySpeed += 1 * delta
