extends Node2D

func _ready():
	# Set the current scene
	Global.CURRENT_SCENE = 'Starting Scene'
	
	# Print out the game version to the console
	print_rich('[color=purple]Inner Dimension Reach '+Global.returnGameVer()+'[/color]');
	
	# Set some global variables
	Global.CREDITS = Global.load_file('assets/dataFiles/credits', 'txt')
	
	# Switch to Main Menu
	Global.switch_scene('scenes/menus/MainMenuState')
