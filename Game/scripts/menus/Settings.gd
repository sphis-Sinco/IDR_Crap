extends Node2D

# node variables
@onready var version = $Version

@onready var window = $Window
@onready var check_box = $Window/CheckBox

@onready var double_speed = $Window/DoubleSpeed
@onready var speedrun_mode = $Window/SpeedrunMode

@onready var start_timer = $StartTimer

# regular variables
var NEW_SCENE = 'scenes/TitleScreen'

# function

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.CURRENT_SCENE = 'Settings Menu'
	version.text = Global.returnMMGameVer()
	
	print(Global.DOUBLE_SPEED)
	
	if Global.DOUBLE_SPEED == true:
		double_speed.set_pressed(true)
	if Global.SPEEDRUN_MODE == true:
		speedrun_mode.set_pressed(true)
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if window.visible == false:
		window.visible = true

# when the leave button is pressed
func _on_leave_pressed():
	NEW_SCENE = 'scenes/menus/MainMenuState'
	start_timer.start()


# when the timer ends: switch scene
func _on_start_timer_timeout():
	Global.switch_scene(NEW_SCENE)


func _on_double_speed_toggled(toggled_on):
	Global.DOUBLE_SPEED = toggled_on


func _on_speedrun_mode_toggled(toggled_on):
	Global.SPEEDRUN_MODE = toggled_on