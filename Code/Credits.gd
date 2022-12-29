extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _input(event):	
	if event is InputEventKey and event.is_pressed() or event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://restauraunt.tscn")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("scroll")

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://restauraunt.tscn")
