extends Node2D

@onready var minute_timer = $MinuteTimer
@onready var time = $Time
@onready var camera_2d = $Player/Camera2D
@onready var player = $Player
@onready var color_rect = $ColorRect

var seconds = 0
var minutes = 0
var hours = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	color_rect.visible = false
	
	Global.CURRENT_SCENE = 'Gameplay State'
	
	time.text = "Time: 00:00:00"
	time.visible = false
	
	if Global.SPEEDRUN_MODE:
		minute_timer.start()
		time.visible = true
	
	# minute_timer.start()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	color_rect.position.x = player.position.x - 160
	color_rect.position.y = player.position.y - 100
	time.position.x = player.position.x - 40
	time.position.y = player.position.y - 60
	if (time.position.y > -20):
		time.position.y = -20
	
	if Input.is_action_just_pressed("pause"):
		player.paused = !player.paused
		
		color_rect.visible = false
		if player.paused:
			color_rect.visible = true
		
	if player.paused:
		if Input.is_action_just_pressed('paused_main_menu'):
			Global.BOUNCE_HAXEN = true
			Global.switch_scene('scenes/menus/MainMenuState')


func _on_minute_timer_timeout():
	_timeIncreate()
	minute_timer.start()

func _timeIncreate():
	seconds += 1
	
	if seconds > 60:
		minutes += 1
		seconds = 0
	
	if minutes > 60:
		hours += 1
		minutes = 0
		
	time.text = "Time: "
	
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
