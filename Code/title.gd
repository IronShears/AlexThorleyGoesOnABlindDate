extends Control


func _on_A_pressed():
	$ColorRect/AnimationPlayer.play("load")
	yield($ColorRect/AnimationPlayer, "animation_finished")
	get_tree().change_scene("res://restauraunt.tscn")
