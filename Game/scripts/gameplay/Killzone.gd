extends Area2D

# Timer
@onready var timer = $Timer

# Player sprite
@onready var player = $"../Player"

func _process(_delta):
	# Move to the player
	position.x = player.position.x

func _on_body_entered(body):
	print_rich('[color=red]Wasted![/color]')
	body.get_node("CollisionShape2D").queue_free() # Remove Collision from player
	
	# Slow down
	Engine.time_scale = 0.5
	
	# Begin timer
	timer.start()


func _on_timer_timeout():
	# Reload scene
	Engine.time_scale = 1
	get_tree().reload_current_scene()
