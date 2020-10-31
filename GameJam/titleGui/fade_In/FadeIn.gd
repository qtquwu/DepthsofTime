extends ColorRect



signal fade_finished

#plays the fade in

func fade_in():
	$AnimationPlayer.play("Fade_In")
	
#stops the fading when the animation ends

func _on_AnimationPlayer_animation_finished(_anim_name):
	emit_signal("fade_finished")


