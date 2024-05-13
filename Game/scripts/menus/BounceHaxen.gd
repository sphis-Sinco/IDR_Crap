extends Sprite2D

# Sprite
@onready var bounce_haxen = $"."

# Collision
@onready var collision_shape_2d = $CollisionShape2D

# vertical speed
var ySpeed = 60

# Move depending on the speed variables
func _process(delta):
	position.y += ySpeed * delta
	ySpeed += 1 * delta
