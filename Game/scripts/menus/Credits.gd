extends Node2D

# node variablesS
@onready var version = $Version
@onready var label = $CreditsPopup/Label
@onready var start_timer = $StartTimer
# regular variables
var NEW_SCENE = 'scenes/TitleScreen'

# Called when the node enters the scene tree for the first time.
func _ready():
	version.text = Global.returnMMGameVer()
	label.text = Global.load_file('assets/dataFiles/credits', 'txt')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_leave_pressed():
	NEW_SCENE = 'scenes/menus/MainMenuState'
	start_timer.start()


func _on_start_timer_timeout():
	Global.switch_scene(NEW_SCENE)
