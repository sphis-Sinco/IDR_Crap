extends Node

# Version and Credit variables
var GAME_VERSION = '0.2.0'
var VERSION_SUFFIX = '[veLe private]'
var CREDITS = ''

# Ingame Variables
var REACHED_FLAG = false
var PAUSED = false
var GAMEPLAY_SETTINGS = false
var GAMEPLAY_SCENE = 'false'

# Main Menu Gameplay Haxen
var BOUNCE_HAXEN = false

# Setting variables
var DOUBLE_SPEED = false
var SPEEDRUN_MODE = false

# Scene Variables
var CURRENT_SCENE = 'Unknown'
var previous_SCENE = 'Unknown'

# Error Variables
var ERROR_MESSAGE = 'Nonexistant'

# Return the Full Game Version String
func returnGameVer():
	return 'v' + GAME_VERSION + ' ' + VERSION_SUFFIX
	
# Return the Main Menu Game Version String
func returnMMGameVer():
	return 'Inner Dimension Reach\nBy Haxen Filp\n'+returnGameVer() + '\n'

# switch scenes
func switch_scene(sceneName):
	# have file location be a variable
	var sceneFile = return_path(sceneName)
	
	# check for if the file exists
	if (FileAccess.file_exists(sceneFile)):
		print_rich('[color=green]Switching scene to file: '+sceneFile+'[/color]')
		get_tree().change_scene_to_file(sceneFile)
	else:
		giveError('Missing file: '+sceneFile)

# send the player (probably dev) to error scene
func giveError(errMsg):
	# Rich Text Label Print
	ERROR_MESSAGE = '[color=red]'+errMsg+'[/color]'
	print_rich(ERROR_MESSAGE)
	# Send to Error Scene
	ERROR_MESSAGE= errMsg
	switch_scene("scenes/Error")

# Return a file location path
func return_path(path, extension = 'tscn'):
	# check for 'res://' and '.tscn'
	var hasLocation = false
	var hasFileExtension = false
	
	# file location is set to a variable
	var returnPath = 'res://'+path + '.'+extension
	
	# check for "res://" at the beginning of the fileName variable
	if path.begins_with('res://') or path.begins_with('user://'):
		hasLocation = true
		
	# check for '.tscn' at the end of the fileName variable
	if path.ends_with('.'+extension):
		hasFileExtension = true
		
	# "has" variable checks
	if hasLocation:
		returnPath = path + '.'+extension
		if hasFileExtension:
			returnPath = path
	elif hasFileExtension:
		returnPath = 'res://'+path
	
	print_rich('[color=blue]'+returnPath+'[/color]')
	return returnPath

# Save a File 
func save_file(path, content, extension):
	var file = FileAccess.open(return_path(path, extension), FileAccess.WRITE)
	file.store_string(content)

# Load a File
func load_file(path, extension):
	var file = FileAccess.open(return_path(path, extension), FileAccess.READ)
	var content = file.get_as_text()
	
	# check for null file content
	if content == null:
		giveError('Null File Content: '+path)
		
		return '<null>' # stop it from continuing 
	
	return content

func _process(_delta):
	# Compare both of the Scene variables
	if previous_SCENE != CURRENT_SCENE:
		previous_SCENE = CURRENT_SCENE
		# Print a Message into the Output letting the developer know the scene Switched
		print_rich('[color=DARK_ORCHID]Swapped Scene: '+CURRENT_SCENE+'[/color]')

# Resett the Settings
func ResetSettings():
	DOUBLE_SPEED = false
	SPEEDRUN_MODE = false
