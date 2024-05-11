extends TextureButton

@onready var update_thing = $"../UpdateThing"
@onready var link_button = $"../UpdateThing/LinkButton"
@onready var description = $"../UpdateThing/Description"

func _ready():
	# link_button.anchors_preset = PRESET_CENTER
	link_button.uri = load_file("assets/updates/update-link.txt")
	# link_button.text = load_file("assets/updates/update-link.txt")
	description.text = "\n"+load_file("assets/updates/update-description.txt")
	
	# print(load_file("assets/updates/current_update.txt"))
	# description.text = "\ntest"

func _on_pressed():
	# load("assets/updates/current_update.txt")
	update_thing.visible = true
	# link_button.uri = load("assets/updates/current_update.txt")

func load_file(fileN):
	var file = FileAccess.open("res://"+fileN, FileAccess.READ)
	var content = file.get_as_text()
	return content
