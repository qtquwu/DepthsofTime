extends CanvasLayer

onready var buttoncontainer = get_node("Panel/VBoxContainer")
onready var buttonscript = load ("res://titleGui/KeyButton.gd")

var keybinds
var buttons = {}

func _ready():
	
	#duplicates the current keybinds so we can back out 
	#if we do not want to save the binds
	
	keybinds = Global.keybinds.duplicate()
	
	#supposed to make boxes showing our binds but not working 
	#for some reason ** NEEDS DEBUGGING**
	
	for key in keybinds.keys():
		
		var hbox = HBoxContainer.new()
		var label = Label.new()
		var button = Button.new()
		
		hbox.set_h_size_flags(Control.SIZE_EXPAND_FILL)
		label.set_h_size_flags(Control.SIZE_EXPAND_FILL)
		button.set_h_size_flags(Control.SIZE_EXPAND_FILL)
		
		label.text = key
		
		
		var button_value = keybinds[key]
		
		if button_value != null:
			
			button.text = OS.get_scancode_string(button_value)
			
		else :
			
			button.text = "Unassigned"
		
		button.set_script(buttonscript)
		button.key = key
		button.value = button_value
		button.menu = self
		button.toggle_mode = true
		button.focus_mode = Control.FOCUS_NONE
		
		hbox.add_child(label)
		hbox.add_child(button)
		buttoncontainer.add_child(hbox)
		
		buttons[key] = button

#changes the binded key and makes sure that the key is not 
#being used elsewhere

func change_bind(key , value):
	
	keybinds[key] = value
	
	for k in keybinds.keys():
		
		if k != key and value != null and keybinds [k] == value:
			
			 keybinds[k] = null 
			 buttons[k].value = null
			 buttons[k].text = "Unassigned"

#makes our back button back us out of the menu

func back():
	
	var pausetime = get_tree().paused
	
	get_tree().paused = false
	
	get_tree().change_scene("res://Game/OptionsScene.tscn")
#saves our new button layout

func save():
	
	Global.keybinds = keybinds.duplicate()
	Global.set_game_binds()
	Global.write_config()
	back()
