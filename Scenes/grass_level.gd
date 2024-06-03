extends BaseScene


func enable_all_buttons():
	$Button.disabled = false

	
func disable_all_buttons():
	$Button.disabled = true


func _on_button_pressed():
	disable_all_buttons()
	EventBus.changing_scenes.emit("grass_level","desert_level")
