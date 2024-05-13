extends Node2D

@onready var err_label = $ErrLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.CURRENT_SCENE = 'Outdated Scene'
	
	Global.save_file('assets/dataFiles/version', Global.GAME_VERSION, 'txt')
	
	err_label.text = 'Whoops! You were playing an outdated version! '+Global.CURRENT_VERSION+' != '+Global.GAME_VERSION
	err_label = "I don't think you will end up here"

	Global.CURRENT_VERSION = Global.load_file('assets/dataFiles/version', 'txt')
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
