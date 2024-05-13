extends Node2D

# Version Label
@onready var version = $Version

# Setting Nodes
@onready var window = $Window

@onready var double_speed = $Window/DoubleSpeed
@onready var speedrun_mode = $Window/SpeedrunMode

# Timer
@onready var start_timer = $StartTimer

# The next Scene to go too
var NEW_SCENE = 'scenes/TitleScreen'

func _ready():
	# Basic Setup
	Global.CURRENT_SCENE = 'Settings Menu'
	version.text = Global.returnMMGameVer()
	
	# Setting Toggles
	if Global.DOUBLE_SPEED == true:
		double_speed.set_pressed(true)
	if Global.SPEEDRUN_MODE == true:
		speedrun_mode.set_pressed(true)

# When you decide to leave the menu
func _on_leave_pressed():
	NEW_SCENE = 'scenes/menus/MainMenuState'
	
	if Global.GAMEPLAY_SETTINGS:
		NEW_SCENE = Global.GAMEPLAY_SCENE
	start_timer.start()

# When the leaving timer is completed
func _on_start_timer_timeout():
	Global.switch_scene(NEW_SCENE)

# Setting Functions

func _on_double_speed_toggled(toggled_on):
	Global.DOUBLE_SPEED = toggled_on

func _on_speedrun_mode_toggled(toggled_on):
	Global.SPEEDRUN_MODE = toggled_on
