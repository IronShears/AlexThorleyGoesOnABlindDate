extends Node



onready var animPlayer : AnimationPlayer = get_tree().get_root().get_node_or_null("/root/world/AnimationPlayer")
onready var dialogueBox : Control = get_tree().get_root().get_node_or_null("/root/world/CanvasLayer/Dialogue")
onready var options = get_tree().get_root().get_node_or_null("/root/world/CanvasLayer/Options")
onready var optionsA = get_tree().get_root().get_node_or_null("/root/world/CanvasLayer/Options/A")
onready var optionsB = get_tree().get_root().get_node_or_null("/root/world/CanvasLayer/Options/B")
var lastEnding = null
var speedrundisable = false

func update():
	animPlayer = get_tree().get_root().get_node_or_null("/root/world/dragworld/AnimationPlayer")
	dialogueBox = get_tree().get_root().get_node_or_null("/root/world/CanvasLayer/Dialogue")
	options = get_tree().get_root().get_node_or_null("/root/world/CanvasLayer/Options")
	optionsA = get_tree().get_root().get_node_or_null("/root/world/CanvasLayer/Options/A")
	optionsB = get_tree().get_root().get_node_or_null("/root/world/CanvasLayer/Options/B")
	

func play_dialogue(nameset, textset, timeset):
	if dialogueBox.visible == false:
			dialogueBox.charname = nameset
			dialogueBox.text = textset
			dialogueBox.time = timeset
			dialogueBox.visible = true
			dialogueBox._play_dialog()
			yield(dialogueBox, "close")
			dialogueBox.visible = false
			
func play_dialogue_auto(nameset, textset, timeset):
	if dialogueBox.visible == false:
			dialogueBox.charname = nameset
			dialogueBox.text = textset
			dialogueBox.time = timeset
			dialogueBox.visible = true
			dialogueBox._play_dialog()
			yield(dialogueBox, "autoclose")
			dialogueBox.visible = false
			
func play_dialogue_auto_set(nameset, textset, timeset, set):
	if dialogueBox.visible == false:
			dialogueBox.charname = nameset
			dialogueBox.text = textset
			dialogueBox.time = timeset
			dialogueBox.waittimer = set
			dialogueBox.visible = true
			dialogueBox._play_dialog()
			yield(dialogueBox, "autoclose")
			dialogueBox.visible = false


func options(a,b):
	optionsA.text = a
	optionsB.text = b
	options.visible = true 
