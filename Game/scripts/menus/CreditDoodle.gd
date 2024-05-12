extends Sprite2D

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	var textureRNG = str(rng.randi_range(1, 2))
	texture = load(Global.return_path('assets/creditsmenu/doodles000'+str(textureRNG), 'png'))
	# res://assets/creditsmenu/doodles0002.png
	
