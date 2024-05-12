extends Node2D

@onready var version = $Version

# Called when the node enters the scene tree for the first time.
func _ready():
	version.text = 'Inner Dimension Reach\nBy Haxen Filp\n'+Global.returnGameVer() + '\n'


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
