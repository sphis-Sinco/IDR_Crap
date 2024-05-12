extends Node2D

var frame = 0

func _process(delta):
	frame += 1
	
func _unhandled_input(event):
	if event is InputEventKey:
		if event.is_released():
			if event.keycode == OS.find_keycode_from_string('ENTER'):
				Global.switch_scene('scenes/MainMenuState')
