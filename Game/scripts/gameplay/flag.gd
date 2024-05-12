extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite_2d.play('idle')

func _on_area_entered(area):
	if !Global.PAUSED:
		if animated_sprite_2d.animation != 'collision':
			animated_sprite_2d.play('collision')
			Global.REACHED_FLAG = true
		# print('MONSDUIJJASIUDJUIASJDIO')
