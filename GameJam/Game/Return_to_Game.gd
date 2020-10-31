extends Control




#returns the user to the title screen when the back
#button is pressed

func _on_Button_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://titleGui/NewGame/PauseMenu.tscn')



