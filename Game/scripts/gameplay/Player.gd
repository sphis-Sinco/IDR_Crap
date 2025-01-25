extends CharacterBody2D

# Sprite
@onready var animated_sprite_2d = $AnimatedSprite2D

# Speed Variables
@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
var multiplier = 1 # Multiplier

# Paused
var paused = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	# Check the Settings
	if Global.DOUBLE_SPEED:
		multiplier = 2
		print_rich('[color=KHAKI]DOUBLE SPEED MODE![/color]')
	if Global.SPEEDRUN_MODE:
		print_rich('[color=KHAKI]SPEEDRUN MODE![/color]')

func _physics_process(delta):
	# Check if paused, check if you have reached the flag
	if paused == false and !Global.REACHED_FLAG:
		if Input.is_action_pressed("down"):
			animated_sprite_2d.play('down')
			
		var direction = Input.get_axis("left", "right") # get input
		
		# Play movement animation or idle animation
		if direction == 0:
			animated_sprite_2d.play('idle')
		else:
			animated_sprite_2d.play('walk')
		
		# Gravity Control
		if not is_on_floor():
			animated_sprite_2d.play('jump')
			velocity.y += gravity * delta

		# Jump Control
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY * multiplier

		# Horizontal Flipping
		if direction == 1:
			animated_sprite_2d.flip_h = false
		if direction == -1:
			animated_sprite_2d.flip_h = true
		
		# Actual Movement
		if direction:
			velocity.x = direction * (SPEED * multiplier)
		else:
			velocity.x = move_toward(velocity.x, 0, (SPEED * multiplier))

		move_and_slide()
	else:
		if paused:
			# Pause Animation
			animated_sprite_2d.pause()
		
		if Global.REACHED_FLAG:
			# Movement control
			if not is_on_floor():
				velocity.y += gravity * delta
				move_and_slide()
			
			# Play the animation
			if animated_sprite_2d.animation != 'victory':
				animated_sprite_2d.play('victory')
