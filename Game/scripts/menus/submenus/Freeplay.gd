extends Node2D

# Leaving timer
@onready var start_timer = $StartTimer
# Version label
@onready var version = $Version

# The next Scene to go too
var NEW_SCENE = 'scenes/TitleScreen'

# Basic Setup
func _ready():
	version.text = Global.returnMMGameVer()

# Just in case
func _process(_delta):
	pass

func _on_leave_pressed():
	NEW_SCENE = 'scenes/menus/MainMenuState'
	start_timer.start()

func _on_start_timer_timeout():
	Global.switch_scene(NEW_SCENE)
