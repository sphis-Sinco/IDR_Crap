extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
var multiplier = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	if Global.DOUBLE_SPEED:
		multiplier = 2
		print_rich('[color=cyan]DOUBLE SPEED MODE![/color]')
	if Global.SPEEDRUN_MODE:
		print_rich('[color=cyan]SPEEDRUN MODE![/color]')

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction == 0:
		animated_sprite_2d.play('idle')
	else:
		animated_sprite_2d.play('walk')
	
	# Add the gravity.
	if not is_on_floor():
		animated_sprite_2d.play('jump')
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY * multiplier

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if direction == 1:
		animated_sprite_2d.flip_h = false
	if direction == -1:
		animated_sprite_2d.flip_h = true
	
	if direction:
		velocity.x = direction * (SPEED * multiplier)
	else:
		velocity.x = move_toward(velocity.x, 0, (SPEED * multiplier))

	move_and_slide()