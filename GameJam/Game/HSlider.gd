extends HSlider

#this is a virable that will be sent to the game
#and change the filed of view accordingly

var field_of_view



#pretty much changes the field of view variable to be 
#what the slider's value is 

func _on_HSlider_changed():
	field_of_view.get_step()
