extends Node2D

# Version Label
@onready var version = $Version

# Buttons
@onready var play = $Play
@onready var settings = $Settings
@onready var credits = $Credits
@onready var freeplay = $Freeplay

# Timer
@onready var start_timer = $StartTimer

# Haxen
@onready var bounce_haxen = $BounceHaxen

# Next Scene
var NEW_SCENE = 'scenes/TitleScreen'

func _ready():
	# Set Basic things
	Global.GAMEPLAY_SETTINGS = false
	Global.REACHED_FLAG = false
	Global.CURRENT_SCENE = 'Main Menu'
	version.text = Global.returnMMGameVer()
	
	# "Spawn" the haxen if you were just in gameplay
	if Global.BOUNCE_HAXEN:
		bounce_haxen.visible = true
		Global.BOUNCE_HAXEN = false


# Timer scripts
func select(scene = NEW_SCENE):
	NEW_SCENE = scene
	start_timer.start()

func _on_start_timer_timeout():
	Global.switch_scene(NEW_SCENE)
	NEW_SCENE = 'scenes/menus/MainMenuState'
	
# Button Press Functions 
func _on_play_pressed():
	select('scenes/gameplay/levels/Level1')
	settings.visible = false
	freeplay.visible = false
	credits.visible = false

func _on_settings_pressed():
	select('scenes/menus/submenus/Settings')
	play.visible = false
	freeplay.visible = false
	credits.visible = false

func _on_credits_pressed():
	select('scenes/menus/submenus/Credits')
	freeplay.visible = false
	play.visible = false
	settings.visible = false

func _on_freeplay_pressed():
	select('scenes/menus/submenus/Freeplay')
	settings.visible = false
	play.visible = false
	credits.visible = false
