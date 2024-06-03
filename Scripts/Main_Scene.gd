extends Control
class_name SceneManager

@onready var anim_player = $AnimationPlayer

var next_scene
var last_scene

func _ready():
	EventBus.changing_scenes.connect(change_scene)
	
func change_scene(from: String, to_scene_name: String):
	last_scene = get_node(from)
	
	next_scene = load("res://Scenes/" + to_scene_name + ".tscn").instantiate()
	next_scene.modulate.a = 0
	add_child(next_scene)
	anim_player.play("fade_in_overlay")
	transfer_data()
	next_scene.setup_scene()
	
func transfer_data():
	if "scene_parameters" in last_scene:
		for i in last_scene.scene_parameters:
			if i in next_scene.scene_parameters:
				next_scene.scene_parameters[i] = last_scene.scene_parameters[i]
				



func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"fade_in_overlay":
			last_scene.cleanup()
			next_scene.modulate.a = 255
			anim_player.play("fade_out_overlay")
			
		"fade_out_overlay":
			next_scene.enable_all_buttons()
