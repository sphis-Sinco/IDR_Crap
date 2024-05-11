extends TextureButton

@onready var update_thing = $"../UpdateThing"
@onready var link_button = $"../UpdateThing/LinkButton"
@onready var description = $"../UpdateThing/Description"

func _ready():
	link_button.anchors_preset = PRESET_CENTER
	# link_button.uri = load("assets/updates/current_update.txt")
	
	# description.text = load("assets/updates/current_update.txt")
	
	# print(load("updates/current_update.txt"))
	description.text = "\ntest"

func _on_pressed():
	# load("assets/updates/current_update.txt")
	update_thing.visible = true
	# link_button.uri = load("assets/updates/current_update.txt")
