# DialogBox.gd
extends Node

# Variables
signal close
signal autoclose
#onready var nav_2d : Navigation2D = $Navigation2D
onready var textBox : RichTextLabel = $Text
onready var nameBox : RichTextLabel = $Name
onready var timer : Timer = $Timer
onready var charname: String = "null"
onready var text: String = "null"
onready var time = 0.05
onready var waittimer = 0.01
onready var hold = false

func _play_dialog():
	textBox.set_process_input(true)
	textBox.set_bbcode(text)
	textBox.set_visible_characters(0)
	timer.wait_time = time
	$Timer2.wait_time = waittimer
	if charname != "null":
		nameBox.set_bbcode(charname)
	else:
		nameBox.set_bbcode("")
	


func _input(event):
	if text != "null":
		if event is InputEventKey and event.is_pressed() or event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT:
			if hold == false: 
				if textBox.get_visible_characters() < textBox.get_total_character_count():
					textBox.set_visible_characters(textBox.get_total_character_count())
				else:
					charname = "null"
					text = "null"
					emit_signal("close")
					$Timer2.start()
				
func _on_Timer_timeout():
	if self.visible == true and textBox.visible_characters < textBox.get_total_character_count():
		if  textBox.visible_characters < textBox.get_total_character_count()-1:
			if text[textBox.visible_characters+1] == " ":
				textBox.set_visible_characters(textBox.get_visible_characters()+1)
	textBox.set_visible_characters(textBox.get_visible_characters()+1)
	if textBox.visible_characters == textBox.get_total_character_count():
		$Timer2.start()


func _on_link_mouse_entered():
	hold = true

func _on_link_mouse_exited():
	hold = false


func _on_Timer2_timeout():
	emit_signal("autoclose")
