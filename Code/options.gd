extends Control

signal pressed
onready var selected

func _on_A_pressed():
	selected = $A.text
	emit_signal("pressed")
	self.visible = false


func _on_B_pressed():
	selected = $B.text
	emit_signal("pressed")
	self.visible = false
