extends CSGBox3D

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		if get_tree().paused:
			show()
		else:
			hide()
		print("paused? ", get_tree().paused)
