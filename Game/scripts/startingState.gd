extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.CURRENT_SCENE = 'Starting Scene'
	print_rich('[color=purple]Inner Dimension Reach '+Global.returnGameVer()+'[/color]');
	Global.CREDITS = Global.load_file('assets/dataFiles/credits', 'txt')
	Global.switch_scene('scenes/TitleScreen')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
