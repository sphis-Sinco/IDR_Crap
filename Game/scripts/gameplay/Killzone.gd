extends Area2D

@onready var timer = $Timer
@onready var player = $"../Player"

func _process(delta):
	position.x = player.position.x

func _on_body_entered(body):
	print_rich('[color=red]Wasted![/color]')
	body.get_node("CollisionShape2D").queue_free()
	#body.queue_free()
	Engine.time_scale = 0.5
	timer.start()


func _on_timer_timeout():
	Engine.time_scale = 1
	if Global.DOUBLE_SPEED or Global.SPEEDRUN_MODE:
		# cool little bouncing haxen filp
		Global.BOUNCE_HAXEN = true
		# disable the settings
		# Global.ResetSettings()
		# switch scene
		Global.switch_scene('scenes/MainMenuState')
	else:
		get_tree().reload_current_scene()
