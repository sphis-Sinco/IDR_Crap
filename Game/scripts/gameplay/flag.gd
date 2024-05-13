extends Node2D

# Sprite
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	# Inital Animation@
	animated_sprite_2d.play('idle')

func _on_area_entered(_area):
	# Check if paused
	if !Global.PAUSED:
		# Check the animation
		if animated_sprite_2d.animation != 'collision':
			# Play the animation
			animated_sprite_2d.play('collision')
			Global.REACHED_FLAG = true
		
