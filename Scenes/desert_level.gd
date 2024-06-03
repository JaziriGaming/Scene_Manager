extends BaseScene

var scene_parameters = {
	"clicks": 0
}

func setup_scene():
	$Clicks.text = "Clicks: " + str(scene_parameters.clicks)

func enable_all_buttons():
	$change_scene_button.disabled = false
	$clicks_btn.disabled = false

	
func disable_all_buttons():
	$change_scene_button.disabled = true
	$clicks_btn.disabled = true


func _on_button_pressed():
	disable_all_buttons()
	EventBus.changing_scenes.emit("desert_level","grass_level")


func _on_clicks_btn_pressed():
	scene_parameters.clicks += 1
	$Clicks.text = "Clicks: " + str(scene_parameters.clicks)
