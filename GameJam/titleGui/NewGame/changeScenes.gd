extends Button

#given variable for the select scene 

export(String) var scene_to_load
var pauseTime
#loads the given scene on button pressed

func _on_Button_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene(scene_to_load)





func _on_Button_Map_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene(scene_to_load)


func Quit():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://TitleGUI.tscn")


func options():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://titleGui/NewGame/OptionsButPause.tscn")
