extends Button

var key
var value 
var menu

var waiting_input = false

func _input(event):
	
	if waiting_input:
		
		#checks if the input event is a key if it is
		#then sets that key as the input for the selection
		
		if event is InputEventKey:
			
			value = event.scancode
			text = OS.get_scancode_string(value)
			menu.change_bind(key, value)
			pressed = false 
			waiting_input = false
		
		#check if its a mouse click if it is back out 
		
		if event is InputEventMouseButton:
			if value != null:
				
				text = OS.get_scancode_string(value)
				
			else:
				
				text = "Unassigned"
				
			pressed = false 
			waiting_input = false

#pretty much when a button is pressed it will display
#press any key and it will making waiting_input true
#so it will lock the button

func _toggled(button_pressed):
	
	if button_pressed:
		
		waiting_input = true 
		set_text ("Press Any Key")
