extends Sprite2D

var rng = RandomNumberGenerator.new()

func _ready():
	var textureRNG = str(rng.randi_range(1, 4)) # Which doodle will be used?
	
	texture = load(Global.return_path('assets/creditsmenu/doodles000'+str(textureRNG), 'png')) # Set the texture
