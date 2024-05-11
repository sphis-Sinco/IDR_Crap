extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#if devlog_list.visible == false:
		#devlog_list.visible = true;
	pass


func _on_devlog_1_pressed():
	scene_swap("devlogs/Devlog1")

func scene_swap(scene):
	var thescene = "res://"+scene+".tscn"
	
	if scene.begins_with("res://"):
		thescene = scene
	
	print_rich('Switching to new Scene: '+thescene)
	
	# get_tree().change_scene_to_file(thescene)
	get_tree().call_deferred('change_scene_to_file', thescene)
