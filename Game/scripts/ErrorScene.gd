extends Node2D

@onready var err_label = $ErrLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	# get datetime
	var thedate = Time.get_datetime_string_from_system().replace(':', '-')
	thedate = thedate.replace('T', '-')
	# error text and file
	err_label.text = 'Whoops! There was an Error in '+Global.CURRENT_SCENE+'!\n\nError: '+Global.ERROR_MESSAGE
	Global.save_file('errors/error-'+thedate, err_label.text, 'txt')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _unhandled_input(event):
	if event is InputEventKey:
		if event.is_released():
			if event.keycode == OS.find_keycode_from_string('ENTER'):
				Global.switch_scene('scenes/TitleScreen')
