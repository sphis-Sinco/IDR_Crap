extends Node2D

# Timers
@onready var minute_timer = $MinuteTimer
@onready var time = $TimeText
@onready var pan_down_timer = $PanDownTimer

# Player and Camera
@onready var player = $Player
@onready var camera_manager = $Player/camera_manager
@onready var camera_2d = $Player/camera_manager/Camera2D

# Paused Background
@onready var color_rect = $ColorRect

# Scene Variables
@export var CURRENT_LEVEL = 'Gameplay'
@export var NEXT_LEVEL = 'Level1'

# Time
var seconds = 0
var minutes = 0
var hours = 0

func _ready():
	# Basic setup
	color_rect.visible = false
	
	Global.CURRENT_SCENE = 'Gameplay State'
	Global.REACHED_FLAG = false
	Global.PAUSED = false
	
	time.text = "Time: 00:00:00"
	time.visible = false
	
	if Global.SPEEDRUN_MODE:
		minute_timer.start()
		time.visible = true

func _process(_delta):
	# Objects that need to move to the player will be here in this little section
	color_rect.position.x = player.position.x - 160
	color_rect.position.y = player.position.y - 100
	
	time.position.x = player.position.x - 40
	time.position.y = player.position.y - 60
	if (time.position.y > -20):
		time.position.y = -20
	
	# When the player pauses the game
	if Input.is_action_just_pressed("pause") && !Global.REACHED_FLAG:
		player.paused = !player.paused
		minute_timer.paused = player.paused # Pause the timer (speedrun timer)
		pan_down_timer.paused = player.paused
		
		# Paused Setup and Execution
		color_rect.visible = false
		Global.GAMEPLAY_SETTINGS = false
		
		if player.paused:
			Global.GAMEPLAY_SETTINGS = true
			color_rect.visible = true
		
		Global.GAMEPLAY_SCENE = 'scenes/gameplay/' + NEXT_LEVEL
		Global.PAUSED = player.paused
	
	# Pause Menu Buttons
	if player.paused:
		if Input.is_action_just_pressed('paused_main_menu'):
			Global.BOUNCE_HAXEN = true
			Global.switch_scene('scenes/menus/MainMenuState')
			
		if Input.is_action_just_pressed('paused_settings'):
			Global.GAMEPLAY_SCENE = 'scenes/gameplay/' + CURRENT_LEVEL
			Global.switch_scene('scenes/menus/submenus/Settings')
			
		if Input.is_action_just_pressed('paused_reset'):
			get_tree().reload_current_scene()
	
	if Input.is_action_pressed('down'):
		if !player.paused:
			movecamdown()
	elif not Input.is_action_just_pressed("down"):
		if camera_manager.position != Vector2(0,0):
			if camera_manager.position >= Vector2(0,0):
				camera_manager.position -= Vector2(0, cam_manager_move_float)
			else:
				camera_manager.position += Vector2(0, cam_manager_move_float)
	
	if Global.REACHED_FLAG:
		if not minute_timer.time_left > 0:
			minute_timer.wait_time = 0.5
			minute_timer.start()

# When a Minute Passes
func _on_minute_timer_timeout():
	_timeIncreate()
	
	if Global.REACHED_FLAG:
		if NEXT_LEVEL == "MainMenu":
			Global.BOUNCE_HAXEN = true
			Global.switch_scene('scenes/menus/MainMenuState')
		else:
			if Global.load_file('scenes/gameplay/' + NEXT_LEVEL, 'tscn') != '<null>':
				Global.switch_scene('scenes/gameplay/' + NEXT_LEVEL)
			else:
				Global.BOUNCE_HAXEN = true
				Global.switch_scene('scenes/menus/MainMenuState')
				
	else:
		minute_timer.start()

# Increase the time
func _timeIncreate():
	# Basic Second, Minute, Hour increase
	seconds += 1
	
	if seconds > 60:
		minutes += 1
		seconds = 0
	
	if minutes > 60:
		hours += 1
		minutes = 0
	
	# Timer Text Control
	time.text = "Time: "
	
	# Timer "Syntax" Setup
	if hours < 10:
		time.text += '0' + str(hours) + ':'
	else:
		time.text += str(hours)
		
	if minutes < 10:
		time.text += '0' + str(minutes) + ':'
	else:
		time.text += str(minutes)
		
	if seconds < 10:
		time.text += '0' + str(seconds)
	else:
		time.text += str(seconds)

var cam_manager_move_float = 0.5

func movecamdown():
	if camera_manager.position == Vector2(0,0) or camera_manager.position <= Vector2(0,10):
		camera_manager.position += Vector2(0, cam_manager_move_float)
