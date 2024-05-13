extends Node2D

# Version Label
@onready var version = $Version

# Credits Label
@onready var label = $CreditsPopup/Label

# Timer
@onready var start_timer = $StartTimer

# Next Scene
var NEW_SCENE = 'scenes/TitleScreen'

func _ready():
	# Basic Setup
	version.text = Global.returnMMGameVer()
	
	# Load the credits
	label.text = Global.CREDITS

# Leave button pressed
func _on_leave_pressed():
	NEW_SCENE = 'scenes/menus/MainMenuState'
	start_timer.start()

# Timer finished
func _on_start_timer_timeout():
	Global.switch_scene(NEW_SCENE)
