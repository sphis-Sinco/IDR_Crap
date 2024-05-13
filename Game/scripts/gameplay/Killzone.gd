extends Area2D

@onready var timer = $Timer
@onready var player = $"../Player"

func _process(_delta):
	position.x = player.position.x

func _on_body_entered(body):
	print_rich('[color=red]Wasted![/color]')
	body.get_node("CollisionShape2D").queue_free()
	#body.queue_free()
	Engine.time_scale = 0.5
	timer.start()


func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
