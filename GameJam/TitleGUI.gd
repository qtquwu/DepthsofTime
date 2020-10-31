extends Control

#selects a button for keyboard support

func _ready():
	$Menu/CenterRow/Buttons/NewGame.grab_focus()

