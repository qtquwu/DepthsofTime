extends Node

onready var settings_menu = load("res://Game/OptionsScene.tscn")
var filepath = "res://keybinds.ini"
var configfile
var keybinds = {}
var Game = false 

#brings up the options menu

func _input(_event):
	if Input.is_key_pressed(KEY_ESCAPE) and Game == true:
		add_child(settings_menu.instance())
		get_tree().paused = true

#assigns key binds to a variable from an ini file 
#then prints the keybinds as a debug statement

func _ready():
	configfile = ConfigFile.new()
	if configfile.load(filepath) == OK:
		for key in configfile.get_section_keys("keybinds"):
			var key_value = configfile.get_value("keybinds", key)
			
			if str(key_value) != "":
				
				keybinds [key] = key_value
				
			else:
				
				keybinds [key] = null
				
	else: 
		print ("config not found")
		get_tree().quit()
	
	set_game_binds()

#sets the binds and makes sure that no other bind is taking 
#the same key

func set_game_binds():
	for key in keybinds.keys():
		var value = keybinds[key]
		
		var actionlist = InputMap.get_action_list(key)
		if !actionlist.empty():
			InputMap.action_erase_event(key, actionlist[0])
		
		if value != null:
			var new_key = InputEventKey.new()
			new_key.set_scancode(value)
			InputMap.action_add_event(key, new_key)

#saves the new keybinds for the next time you play

func write_config():
	
	for key in keybinds.keys():
		
		var key_value = keybinds[key]
	
	#makes sure we do not break our buttons
	
		if key_value != null:
			
			configfile.set_value("keybinds", key, key_value)
		
		else:
			
			configfile.set_value("keybinds", key, "")
	
	configfile.save(filepath)
