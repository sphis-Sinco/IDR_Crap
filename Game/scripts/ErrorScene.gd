extends Node2D

@onready var err_label = $ErrLabel

func _ready():
	# Get the date
	var thedate = Time.get_datetime_string_from_system().replace(':', '-')
	thedate = thedate.replace('T', '-')
	
	# Set the label and save the file
	err_label.text = 'Whoops! There was an Error in '+Global.CURRENT_SCENE+'!\n\nError: '+Global.ERROR_MESSAGE
	Global.save_file('errors/error-'+thedate, err_label.text, 'txt')
	
	# Set the scene AFTER the CURRENT_SCENE Global variable is used
	Global.CURRENT_SCENE = 'Error Menu'

func _unhandled_input(event):
	if event is InputEventKey:
		if event.is_released():
			if event.keycode == OS.find_keycode_from_string('ENTER'):
				Global.switch_scene('scenes/menus/MainMenuState') # Leave the Menu
