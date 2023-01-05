extends Node2D

signal Test(value) 

func _ready():
	pass # Replace with function body.
	print("Child0")
	yield(get_tree().create_timer(0.01), "timeout")
	var mytime=Time.get_time_string_from_system()
	emit_signal("Test","a bit of data: "+str(mytime))

