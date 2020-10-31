extends HSlider

#makes a sound variable

var sound


#allows the slider to change the sound variable 
#and control our sound

func _on_HSlider_changed():
	sound.get_step()
