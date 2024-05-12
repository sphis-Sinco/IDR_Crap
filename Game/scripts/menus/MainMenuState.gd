extends Node2D

# node variables
@onready var version = $Version

@onready var play = $Play
@onready var settings = $Settings
@onready var credits = $Credits

@onready var start_timer = $StartTimer

@onready var bounce_haxen = $BounceHaxen

# regular variables

var NEW_SCENE = 'scenes/TitleScreen'

# functions

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.REACHED_FLAG = false
	Global.CURRENT_SCENE = 'Main Menu'
	version.text = Global.returnMMGameVer()
	
	if Global.BOUNCE_HAXEN:
		bounce_haxen.visible = true
		Global.BOUNCE_HAXEN = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# when a Button node is selected
func select(scene = NEW_SCENE):
	NEW_SCENE = scene # the scene you will be transported to
	start_timer.start() # begin the StartTimer timer.

# when the Play node is pressed
func _on_play_pressed():
	select('scenes/gameplay/levels/Level1')
	settings.visible = false
	credits.visible = false

# when the StartTimer node time ends
func _on_start_timer_timeout():
	Global.switch_scene(NEW_SCENE)
	NEW_SCENE = 'scenes/menus/MainMenuState'


func _on_settings_pressed():
	select('scenes/menus/Settings')
	play.visible = false
	credits.visible = false


func _on_credits_pressed():
	select('scenes/menus/Credits')
	play.visible = false
	settings.visible = false
