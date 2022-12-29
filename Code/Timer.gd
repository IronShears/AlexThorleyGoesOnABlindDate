extends Timer

var disableStopper = true

func _unhandled_input(event):
	if disableStopper == false:
		if event is InputEventKey and event.is_pressed() or event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT:
			stop()
			emit_signal("timeout")

func starting():
	disableStopper = true
	start()
	$Buffer.start()


func _on_Buffer_timeout():
	disableStopper = false
