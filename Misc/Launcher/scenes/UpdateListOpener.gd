extends TextureButton

@onready var update_thing = $"../UpdateThing"
@onready var link_button = $"../UpdateThing/LinkButton"

func _ready():
	link_button.anchors_preset = PRESET_CENTER
	link_button.uri = load("assets/updates/current_update.txt")

func _on_pressed():
	# load("assets/updates/current_update.txt")
	update_thing.visible = true
	# link_button.uri = load("assets/updates/current_update.txt")

func load(fileN):
	var file = FileAccess.open("red://"+fileN, FileAccess.READ)
	var content = file.get_as_text()
	return content
