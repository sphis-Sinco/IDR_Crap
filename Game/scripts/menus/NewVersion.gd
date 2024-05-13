extends Node2D

@onready var err_label = $ErrLabel

func _ready():
	# Set the Current scene
	Global.CURRENT_SCENE = 'Outdated Scene'
	
	# Save the CURRENT Version
	Global.save_file('assets/dataFiles/version', Global.GAME_VERSION, 'txt')
	
	# Set the Label
	err_label.text = 'Whoops! You were playing an outdated version! '+Global.CURRENT_VERSION+' != '+Global.GAME_VERSION
	
	# Set the Current Saved Version to the actual version
	# Global.CURRENT_VERSION = Global.load_file('assets/dataFiles/version', 'txt')
